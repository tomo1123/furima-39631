# README


## usersテーブル

| Column            | Type       | Options                 |
| ------------------| ---------- | ------------            |
| nickname          | string     | null: false             |
| email             | string     | null: false,unique: true|
| encrypted_password| string     | null: false             |
| family_name       | string     | null: false             |
| first_name        | string     | null: false             |
| family_name_kana  | string     | null: false             |
| first_name_kana   | string     | null: false             |
| birthday          | date       | null: false             |

has_many :items
has_many :orders


## items テーブル

| Column          | Type      | Options                        |
| ------          | ------    | -----------                    |
| title           | string    | null: false                    |
| items_text      | text      | null: false                    |
| condition_id    | integer   | null: false                    |
| category_id     | integer   | null: false                    |
| delivery_fee_id | integer   | null: false                    |
| prefecture_id   | integer   | null: false                    | 
| delivery_day_id | integer   | null: false                    | 
| price           | integer   | null: false, numericality      |
| user            | references| null: false, foreign_key: true |

belongs_to :user
has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address


## addresses

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| order               | references | null: false, foreign_key: true |
| postal_code         | string     | null: false                    |
| prefecture_id       | string     | null: false                    |
| city                | string     | null: false                    |
| addresses           | string     | null: false                    |
| building            | string     |                                |
| phone_number        | string     | null: false                    |


belongs_to :order
