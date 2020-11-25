require 'rails_helper'
 RSpec.describe User, type: :model do
   describe 'ユーザー新規登録' do
     it "nicknameが空だと登録できない" do
       @user = FactoryBot.build(:user)
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
       @user = FactoryBot.build(:user)
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "メールアドレスが一意性であること" do
      @user= FactoryBot.build(:user)
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "メールアドレスは、＠を含む必要がある" do
      @user= FactoryBot.build(:user)
      @user.email = "estexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      

     end
     it "パスワードが必須であること" do
      @user= FactoryBot.build(:user)
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      
     end
     it "パスワードは６文字以上での入力が必須であること" do
      @user= FactoryBot.build(:user)
      @user.password = "00aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

     end
     it "パスワードは、半角英数字混合での入力が必須であること" do
      @user= FactoryBot.build(:user)
      @user.password = "0000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")


     end
     it "パスワードは確認用を含めて２回入力すること" do
      @user= FactoryBot.build(:user)
      # @user.password = ""
      @user.password_confirmation = "test7890"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "パスワードとパスワード（確認用）、の値の一致が必須であること" do
      @user = FactoryBot.build(:user)
      @user.password_confirmation = "00a0"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      

     end
     it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user = FactoryBot.build(:user)
      @user.last_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")

     end
     it "ユーザー本名は全角 (漢字.ひらがな.カタカナ）での入力が必須であること" do
      @user = FactoryBot.build(:user)
      @user.last_name = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end
     it "ユーザー本名は全角 (漢字.ひらがな.カタカナ）での入力が必須であること" do
      @user = FactoryBot.build(:user)
      @user.first_name = "bbbb"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end
     it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user = FactoryBot.build(:user)
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
     end
     it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user = FactoryBot.build(:user)
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
     end
     it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user = FactoryBot.build(:user)
      @user.last_name_kana = "aa"
      @user.first_name_kana = "aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください", "First name kana 全角カタカナを使用してください")
     end
     it "生年月日が必須であること" do
      @user = FactoryBot.build(:user)
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")


      
     end

   end
 end