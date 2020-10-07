FactoryBot.define do
  factory :item do
    association :user
    title{"テスト"}
    explanation{"テスト"}
    category_id{3}
    price{90000}
    status_id {3}
    burden_of_delivery_fee_id{3}
    shipping_area_id {3}
    shipping_date_id{3}
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
