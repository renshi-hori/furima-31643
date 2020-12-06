class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :if

  def index 
    @order_address = OrderAddress.new 
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
  
    if @order_address.valid?
      pay_item
      
    @order_address.save
    redirect_to root_path
    else
    render :index
    
    end
  end


  private

  def order_address_params
    params.require(:order_address).permit(:phone_number, :postal_code, :prefecture_id, :city, :addresses, :building ).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
    
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_address_params[:token],   #カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  def if 
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end  
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
