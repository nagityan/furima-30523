FactoryBot.define do
  factory :user_purchase do
    postal_code{"123-4567"}
    prefecture_id{3}
    city{"テスト"}
    address{"1-2-3"}
    phone_number{"00000000001"}
    token{"tok_abcdefghijk00000000000000000"}
    user_id{3}
    item_id{3}
  end
end