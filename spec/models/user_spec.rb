require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it'nicknameが空では登録できない' do
      user =User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', family_name: '山田', first_name: '太郎', family_name_kana: 'ヤマダ', first_name_kana: 'タロウ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.hull_messages).to include("Nickname can't be blank")
    end
  end
end

 
