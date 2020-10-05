# README

## usersテーブル
|  Column         |  type    |  Options   |
|   ----          |   ----   |    ----    |
|  nickname       |  string  | null: false|
|  email          |  string  | null: false|
|  password       |  string  | null: false|
|  first_name     |  string  | null: false|
|  last_name      |  string  | null: false|
|  kana_first     |  string  | null: false|
|  kana_last      |  string  | null: false|
|  birthday       |  date    | null: false|

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
|  Column                     |  type       |  Options                     |
| ----                        | ----        | ----                         |
|  title                      |  string     | null: false                  |
|  explanation                |  text       | null: false                  |
|  category_id                |  integer    | null: false                  |
|  price                      |  integer    | null: false                  |
|  status_id                  |  integer    | null: false                  |
|  burden_of_delivery_fee_id  |  integer    | null: false                  |
|  shipping_area_id           |  integer    | null: false                  |
|  shipping_date_id           |  integer    | null: false                  |
|  user                       |  reference  | null: false,foreign_key: true|


### Association
- has_one :purchase
- belongs_to :user


## addressesテーブル
|  Column          |  type       |  Options                     |
| ----             | ----        | ----                         |
|  postal_code     |  string     | null: false                  |
|  prefecture_id   |  integer    | null: false                  |
|  city            |  string     | null: false                  |
|  address         |  string     | null: false                  |
|  building        |  string     |                              |
|  phone_number    |  string     | null: false                  |
|  purchase        |  reference  | null: false,foreign_key: true|



### Association
- belongs_to :transaction




## purchasesテーブル
|  Column          　　　|  type       |  Options                     |
| ----             　　　| ----        | ----                         |
|  user            　　　|  reference  | null: false,foreign_key: true|
|  item            　　　|  reference  | null: false,foreign_key: true|



### Association
- belongs_to :item
- belongs_to :user
- has_one: address