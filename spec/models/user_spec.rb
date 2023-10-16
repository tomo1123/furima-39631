require 'rails_helper'

 RSpec.describe User, type: :model do
    describe 'ユーザー新規登録' do
      before do
         @user = FactoryBot.build(:user)
        it 'nicknameが空では登録できない' do
          user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
          user.valid?
          expect(user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
         user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
         user.valid?
         expect(user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailが空では登録出来ない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
     end
   end

    describe 'ユーザー新規登録' do
       before do
         @user = FactoryBot.build(:user)
       end

       context '新規登録がうまくいくとき' do
         it "passwordが6文字以上であれば登録できる" do
           @user.password = "123456"
           @user.password_confirmation = "123456"
           expect(@user).to be_valid
         end
      
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
           @user.email = "test@example"
           expect(@user).to be_valid
         end
       end
    end
end
