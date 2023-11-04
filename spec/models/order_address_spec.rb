require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user: @user)
    
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end
  
    


  context '内容に問題ない場合' do
    it "postal_code,prefecture_id,city,address_line_1,phone_number,tokenが存在すれば登録できること" do
      expect(@order_address).to be_valid
    end

    it "building_nameが空でも登録できること" do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'userが紐付いていないと保存できないこと' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていないと保存できないこと' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

  
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it "prefecture_idが0では登録できないこと" do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "cityが空では登録できないこと" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it "address_line_1が空では登録できないこと" do
      @order_address.address_line_1 = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address line 1 can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが10桁未満では登録できないこと" do
      @order_address.phone_number = "090123456"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが12桁以上では登録できないこと" do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end


    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "phone_numberが英数混合では登録できないこと" do
      @order_address.phone_number = "090123456ab"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it "user_idが空では登録できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank") 
    end

    it "item_idが空では登録できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank") 
    end

      


  end
end

