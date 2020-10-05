# README

## usersテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  nickname  |  string  | null: false|
|  email  |  string  | null: false|
|  password  |  string  | null: false|
|  name  |  string  | null: false|
|  name-kana  |  string  | null: false|
|  birthday  |  integer  | null: false|

### Association
- has_many :merchandises
- has_many :purchases

## merchandiseテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  title  |  string  | null: false|
|  explanation  |  text | null: false|
|  category  |  string | null: false|
|  price  |  integer | null: false|
|  status  |  string | null: false|
|  burden_of_delivery_fee  |  string | null: false|
|  shipping_area  |  string | null: false|
|  user_id  |  reference  | null: false,foreign_key: true|


### Association
- has_one :purchase
- belongs_to :user


## purchaseテーブル
|  Column  |  type  |  Options|
| ---- | ---- | ---- |
|  credit_number  |  integer  | null: false|
|  credit_exp  |  integer | null: false|
|  credit_cvv  |  integer | null: false|
|  postal_code  |  integer | null: false|
|  street_address  |  string | null: false|
|  address  |  integer | null: false|
|  phone_number  |  integer| null: false|
|  user_id  |  reference  | null: false,foreign_key: true|


### Association
- belongs_to :merchandise
- belongs_to :user