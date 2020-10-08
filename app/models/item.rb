class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :burden_of_delivery_fee
  
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
    validates :price,numericality: {only_integer: true,greater_than: 300, less_than: 9999999}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_of_delivery_fee_id
    validates :shipping_area_id
    validates :shipping_date_id
  end 



end

