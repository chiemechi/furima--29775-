class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :charges
  belongs_to_active_hash :condition
  belongs_to_active_hash :send_date
  belongs_to :user


  has_one_attached :image

  
  validates  :description, presence: true
  validates  :name, presence: true
  validates  :price, presence: true,numericality: {greater_than_or_equal_to: 300,less_than: 9999999},format: {with: /\A[0-9]+\z/}
  validates  :image, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :area_id
    validates :charges_id
    validates :condition_id
    validates :send_date_id
   end
end

