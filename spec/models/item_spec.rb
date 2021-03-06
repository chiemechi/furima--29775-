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
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'condition_idが空では登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it 'charges_id_idが空では登録できないこと' do
      @item.charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Charges must be other than 1')
    end

    it 'area_idが空では登録できないこと' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'send_date_idが空では登録できないこと' do
      @item.send_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Send date must be other than 1')
    end

    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '価格の範囲が、¥300~出ないとダメ' do
      @item.price = 100
      @item.valid?

      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格の範囲が、上限9999999ないとダメ' do
      @item.price = 1_000_000_000_000_000_000_000_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '４４４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
