class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :burden_of_delivery_fee

  validates :title, :explanation,:category,:status,:burden_of_delivery_fee,:shipping_area,:shipping_date, presence: true
  validates :genre_id,:category,:status,:burden_of_delivery_fee,:shipping_area,:shipping_date, numericality: { other_than: 1 } 

  has_one_attached :image

end

