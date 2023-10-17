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
