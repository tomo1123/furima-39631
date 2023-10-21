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


      it '商品画像がない場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がない場合は出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明がない場合は出品できない' do
        @item.items_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Items text can't be blank")
      end

      it 'カテゴリーの情報がない場合は出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報がない場合は出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担についての情報がない場合は出品できない' do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '発送元の地域についての情報がない場合は出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数についての情報がない場合は出品できない' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'ユーザーが紐付いていないと商品は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
