# README


## usersテーブル

| Column            | Type       | Options     |
| ------------------| ---------- | ------------|
| nickname          | string     | null: false |
| email             | string     | null: false |
| encrypted_password| string     | null: false |
| family_name       | string     | null: false |
| first_name.       | string     | null: false |
| family_name_kana  | string     | null: false |
| first_name_kana   | string     | null: false |
| birthday.         | datetime   | null: false |

has_many :items
has_many :orders


## item テーブル

| Column          | Type      | Options                        |
| ------          | ------    | -----------                    |
| image           | string    | null: false                    |
| title           | string    | null: false                    |
| items_text      | text.     | null: false.                   |
| condition_id    | integer   | null: false                    |
| category_id     | integer   | null: false                    |
| delivery_fee_id | integer   | null: false                    |
| prefecture_id   | integer   | null: false.                   | 
| price           | integer   | null: false, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }   |
| comment         | text      | null: false, if: : user_id_present?| 
| user_id.        | integer.  | null: false.                   |

belongs_to :user
has_one_attached :image



## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item