class OrderAddress
  include ActiveModel::Model
  attr_accessor :city, :building, :phone_number, :prefecture_id, :postal_code, :house_number, :token, :item_id, :user_id
  # # :tokenの追加をする・ストロングパラメーターで受け取っているものを記述する
  # ここにバリデーションの処理を書く
  # ordersのバリデーション

  # カード情報のバリデーション

  # addressのバリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    # 都道府に関するバリデーション
    validates :prefecture_id, numericality: { other_than: 0 }
    # 市町村に関するバリデーション
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    # 携帯番号
    validates :phone_number, format: { with: /\A[0-9]+\z/ }
    validates :house_number
  end
  validates :phone_number, length: { maximum: 11 }

  validates :token, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Adress.create(city: city, building: building, prefecture_id: prefecture_id, postal_code: postal_code, house_number: house_number, order_id: order.id, phone_number: phone_number)
  end
end
