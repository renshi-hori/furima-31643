require 'rails_helper'
 RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

   describe '商品出品機能' do
     it "正しい値が入力されれば正しく登録される" do
      expect(@item).to be_valid
      end
     it "商品画像を1枚つけることが必須であること" do
      @item.image =nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it "商品の説明が必須であること" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
     end
     it "カテゴリーの情報が必須であること" do
      @item.category = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
     end
     it "商品の状態についての情報が必須であること" do
      @item.sales_status = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status is not a number")
     end
     it "配送料の負担についての情報が必須であること" do
      @item.shipping_free_status = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping free status is not a number")
     end
     it "発送元の地域についての情報が必須であること" do
      @item.prefecture = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
      
     end
     it "発送までの日数についての情報が必須であること" do
      @item.scheduled_delivert = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivert is not a number")
     end
     it "価格についての情報が必須であること" do
      @item.price =nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     it "価格の範囲が、¥300円未満であると登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")

     end
     it "価格の範囲が、¥9_999_999より高額だと登録できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
     end
     it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")

     end
     

   end
 end