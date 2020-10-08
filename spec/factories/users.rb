FactoryBot.define do
  factory :user do
    nickname{"ニックネーム"}
    first_name{"テスト"}
    last_name{"タロウ"}
    kana_first{"テストデス"}
    kana_last{"テスト"}
    birthday{"1999-12-12"}
    email {Faker::Internet.free_email}
    password  {"qwer1234"}
    password_confirmation {password}
  end
end
