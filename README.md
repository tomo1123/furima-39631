# README


## usersテーブル

| Column            | Type       | Options     |
| ------------------| ---------- | ------------|
| nickname          | string     | null: false |
| email             | unique     | true        |
| encrypted_password| string     | null: false |
| family_name       | string     | null: false |
| first_name        | string     | null: false |
| family_name_kana  | string     | null: false |
| first_name_kana   | string     | null: false |
| birthday          | date       | null: false |

has_many :items
has_many :orders


## items テーブル

| Column          | Type      | Options                        |
| ------          | ------    | -----------                    |
| title           | string    | null: false                    |
| items_text      | text.     | null: false.                   |
| condition_id    | integer   | null: false                    |
| category_id     | integer   | null: false                    |
| delivery_fee_id | integer   | null: false                    |
| prefecture_id   | integer   | null: false                    | 
| price           | integer   | null: false, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }   |
| user_id         | references| null: false.                   |

belongs_to :user
has_one_attached :image
has_many :orders

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item


## addresses

| Column              | Type       | Options                        |
| -------             | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| order               | references | null: false, foreign_key: true |
| postal_code         | integer    | null: false                    |
| prefecture          | string     | null: false                    |
| city                | string     | null: false                    |
| address_line_1      | string     | null: false                    |
| address_line_2      | string     | null: false                    |
| phone_number        | integer    | null: false                    |


belongs_to :user
belongs_to :order
