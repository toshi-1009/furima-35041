# README
# テーブル設計

## usersテーブル

|colum            | Type    | Options     |
| ----------------|-------- |------------ |
| nickname        | string  | nul: false  |
| email           | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |

### Association
has_many :items
has_many :orders


## itemsテーブル

|colum             | Type    | Options     |
| -----------------|-------- |------------ |
| product_name     | string  | null: false |
| description      | string  | null: false |
| category         | string  | null: false |
| product_state    | string  | null: false |
| shipping_charges | integer | null: false |
| shipping_area    | string  | null: false |
| shipping_day     | integer | null: false |
| selling_price    | integer | null: false |
 
belongs_to :user
has_one :order

 ## ordersテーブル
|colum     | Type    | Options     |
| ---------|-------- |------------ |
| buy_item | string  |             |
| buyer    | string  |             |

belongs_to :item
belongs_to :user
has_one :payment
has_one :address

## paymentsテーブル

|colum             | Type    | Options     |
| -----------------|-------- |------------ |
| card_number      | integer | null: false |
| expiration_month | integer | null: false |
| expiration_year  | integer | null: false |
| security_code    | integer | null: false |

belongs_to :order


## addressesテーブル
| postal_code    | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | integer | null: false |
| building_name  | string  | null: false |
| phone_number   | integer | null: false |

belongs_to :order