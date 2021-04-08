# README
# テーブル設計

## usersテーブル

|colum            | Type    | Options                   |
| ----------------|-------- |-------------------------- |
| nickname        | string  | nul: false                |
| email           | string  | null: false, unique: true |
| first_name      | string  | null: false               |
| last_name       | string  | null: false               |
| first_name_kana | string  | null: false               |
| last_name_kana  | string  | null: false               |
| birthday        | date    | null: false               |

### Association
has_many :items
has_many :orders

## itemsテーブル

|colum                 | Type     | Options           |
| ---------------------|--------- |------------------ |
| product_name         | string   | null: false       |
| description          | string   | null: false       |
| category_id          | integer  | null: false       |
| product_state_id     | integer  | null: false       |
| shipping_charges_id  | integer  | null: false       |
| shipping_area_id     | integer  | null: false       |
| shipping_day_id      | integer  | null: false       |
| selling_price        | integer  | null: false       |
| user_id              |reference | foreign_key: true |
 
belongs_to :user
has_one :order

 ## ordersテーブル
|colum | Type      | Options           |
| -----|---------- |------------------ |
| user | reference | foreign_key: true |
| item | reference | foreign_key: true |

belongs_to :item
belongs_to :user
has_one :address


## addressesテーブル
| postal_code      | integer | null: false |
| -----------------| --------|-------------|
| shipping_area_id | integer | null: false |
| municipalities   | string  | null: false |
| address          | integer | null: false |
| building_name    | string  |             |
| phone_number     | integer | null: false |

belongs_to :order