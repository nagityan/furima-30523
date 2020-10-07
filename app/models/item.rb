class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :burden_of_delivery_fee
  
  has_one_attached :image
  belongs_to :user

  validates :title, :explanation,:image,:price, presence: true
  validates :category_id,:status_id,:burden_of_delivery_fee_id,:shipping_area_id,:shipping_date_id, numericality: { other_than: 1 } 


end

