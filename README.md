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
- has_one :address
- has_many :items

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
|  user                       |  reference  | null: false,foreign_key: true|


### Association
- has_one :address
- belongs_to :user


## addressテーブル
|  Column          |  type       |  Options                     |
| ----             | ----        | ----                         |
|  postal_code     |  integer    | null: false                  |
|  prefecture      |  string     | null: false                  |
|  city            |  string     | null: false                  |
|  address         |  integer    | null: false                  |
|  building        |  string     |                              |
|  phone_number    |  integer    | null: false                  |
|  user            |  reference  | null: false,foreign_key: true|
|  merchandise     |  reference  | null: false,foreign_key: true|


### Association
- belongs_to :item
- belongs_to :user