class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destory]


  def index
    @items = Item.all.order("created_at ASC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @item.update(item_params)
     redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    
    if current_user.id == @item.user_id 
     @item.destroy
     redirect_to root_path
    else
      redirect_to root_path
    end
  end


  
  def show
    @item = Item.find(params[:id])
  end


  


  private
  
  def item_params
    params.require(:item).permit(:name, :category_id, :sales_status_id, :info, :shipping_free_status_id, :prefecture_id, :scheduled_delivert_id, :price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
