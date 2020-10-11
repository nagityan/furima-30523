class UserPurchase
  include ActiveModel::Model


  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city,:address,:building, :phone_number,:token,:purchase_id
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :phone_number,format:{with: /\A\d{10,11}\z/}
    validates :token
  end

  validates :prefecture_id,numericality: { other_than: 1 }
  

  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address: address,building: building,phone_number: phone_number,purchase_id: purchase.id)
  end
 


end