require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全て記入されていると登録できる' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'condition_idが空では登録できないこと' do
      @item.condition = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it 'charges_id_idが空では登録できないこと' do
      @item.charges = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Charges can't be blank")
    end

    it 'area_idが空では登録できないこと' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'send_date_idが空では登録できないこと' do
      @item.send_date = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Send date can't be blank")
    end

    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999出ないとダメ' do
      @item.price = 100
      @item.valid?

      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '４４４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
