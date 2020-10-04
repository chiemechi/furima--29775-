require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全て記入されていると登録できる' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が空では登録できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end

    it '都道府県が空では登録できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it '市区町村が空では登録できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank", 'City is invalid')
    end

    it '番地が空では登録できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空では登録できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end

    it '郵便番号にはハイフンが必要である' do
      @order_address.postal_code = '3333333'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号にはハイフンは不要である' do
      @order_address.phone_number = '3333-33'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号、は11桁以内である' do
      @order_address.phone_number = 666_663_377_777_777_777
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
  end
end
