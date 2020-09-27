class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :send_date
  belongs_to :user



  validates  :name, presence: true,numericality: {greater_than_or_equal_to: 300,less_than: 9999999}
  validates  :description, presence: true
  validates  :price, presence: true, format: { with: /^[0-9]+$/ }


  with_options presence: true, numericality: { other_than: 1 } do
  validates :category
  validates :area
  validates :charge
  validates :condition
  validates :send_date
  end

