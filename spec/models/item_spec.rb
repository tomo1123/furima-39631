require 'rails_helper'

  RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品ができる場合' do
        it '全ての情報が正しく入力されていれば出品できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品ができない場合' do
        it '商品画像がない場合は出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名がない場合は出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it '商品の説明がない場合は出品できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it 'カテゴリーが選択されていない場合は出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it '商品の状態が選択されていない場合は出品できない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end

        it '配送料の負担が選択されていない場合は出品できない' do
          @item.shipping_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
        end

        it '発送元の地域が選択されていない場合は出品できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '発送までの日数が選択されていない場合は出品できない' do
          @item.days_to_ship_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end

        it '価格がない場合は出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が300円未満の場合は出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it '価格が9,999,999円を超過する場合は出品できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it '価格は半角数字でなければ出品できない' do
          @item.price = '３０００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end


end
