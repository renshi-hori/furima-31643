require 'rails_helper'
 RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

   describe '商品購入機能' do
     it "正しい値が入力されれば正しく登録される" do
      expect(@order_address).to be_valid
      end
     it "郵便番号が必須でなおかつハイフンがないと購入できない" do
      @order_address.postal_code = 1234566
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code ハイフンを使用してください")
     end
     it "都道府県が０番以外だと購入できる" do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")

     end
     it "市区町村がないと購入できない" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")

     end
     it "番地がないと購入できない" do
      @order_address.addresses = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
     end
     it "電話番号がないと登録できない" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")

     end
     it "電話番号が11桁より上だと購入できない" do
      @order_address.phone_number = "090876543212"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Too long")


      
     end
     it "電話番号は数字のみだと購入できる" do
      @order_address.phone_number = "090-8765-3212"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Too long")
      
     end

     it "トークンが空だと登録できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")

     end
    
     
     

   end
 end