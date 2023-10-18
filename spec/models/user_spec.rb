require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていないと登録できない" do
        @user.email = "testexample.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "emailが重複していると登録できない" do
        @user.save
        user2 = FactoryBot.build(:user, email: @user.email)
        user2.valid?
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが全角では登録できない" do
        @user.password = '１２３４５６'
        @user.password_confirmation = '１２３４５６'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameが全角でないと登録できない" do
        @user.last_name = 'yamada'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = 'tarou'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "last_name_kanaが全角カタカナでないと登録できない" do
        @user.last_name_kana = 'やまだ'
        @user.valid? 
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "first_name_kanaが全角カタカナでないと登録できない" do
        @user.first_name_kana = 'たろう'
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid? 
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

    

    context '新規登録がうまくいくとき' do
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end
      
      it "last_nameが全角であれば登録できる" do
        @user.last_name = "山田"
        expect(@user).to be_valid
      end
      
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      
      it "last_name_kanaが全角カタカナであれば登録できる" do
        @user.last_name_kana = "ヤマダ"
        expect(@user).to be_valid
      end
      
      it "first_name_kanaが全角カタカナであれば登録できる" do
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end

      it "birthdayが存在すれば登録できる" do
        @user.birthday = "2020-01-01"
        expect(@user).to be_valid
      end
      
      it "emailに@が含まれていれば登録できる" do
        @user.email = "test@example.com"
        expect(@user).to be_valid
      end
    end
  end
end
