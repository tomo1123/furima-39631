require 'rails_helper'

RSpec.describe Item, type: :model do
  include ActionDispatch::TestProcess
 
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id) # ユーザーの情報を含めて商品を作成
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '全ての情報が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
  end

  
  describe '商品出品機能' do
    context '商品出品ができない場合' do
      it '価格がない場合は出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満の場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
    

      it '価格が9,999,999円を超過する場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it '価格は半角数字でなければ出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
