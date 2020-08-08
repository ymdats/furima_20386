# テーブル設計
--------------------------------------------------------
## users テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name  | string      | null: false |
| first_name   | string      | null: false |
| family_kana  | string      | null: false |
| first_kana   | string      | null: false |
| birthday     | integer     | null: false |
### Association
- has_many :items
- has_many :orders
--------------------------------------------------------
## items テーブル
| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| user    | reference | null: false, foreign_key: true |
| image   | text      | null: false |
| name    | string    | null: false |
| explain | text      | null: false |
| category          | integer    | null: false |
| status            | integer    | null : false |
| shipping_charge   | integer    | null: false |
| shipping_area     | integer    | null: false |
| shipping_duration | integer    | null: false |
| price   | integer   | null: false |
### Association
- belongs_to :user
- has_one :order
--------------------------------------------------------
## orders テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
- belongs_to :user
- belongs_to :item
- has_one :address
--------------------------------------------------------
## addresses テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone_number  | string     | null: false |
### Association
- belongs_to :order
--------------------------------------------------------
