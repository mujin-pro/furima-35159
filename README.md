## users テーブル

| Column                | Type      | Options                         |
| --------------------- | --------- | ------------------------------- |
| nickname              | string    | null: false                     |
| email                 | string    | null: false                     |
| encrypted_password    | string    | null: false                     |
| family_name           | string    | null: false                     |
| last_name             | string    | null: false                     |
| family_name_furigana  | string    | null: false                     |
| last_name_furigana    | string    | null: false                     |
| birth_day             | date      | null: false                     |

### Association
has_many :products
has_many :liquidations
has_many :delivery_addresses

## products テーブル

| Column                 | Type       | Options                         |
| ---------------------- | ---------- | ------------------------------- |
| name                   | string     | null: false                     |
| product_description    | text       | null: false                     |
| product_category_id    | integer    | null: false                     |
| product_status_id      | integer    | null: false                     |
| delivery_charge_id     | integer    | null: false                     |
| delivery_source_id     | integer    | null: false                     |
| days_up_to_delivery_id | integer    | null: false                     |
| price                  | integer    | null: false                     |
| user                   | references | null: false, foreign_key: true  |

### Association
belongs_to :user
has_one :liquidation
has_one :delivery_address

## liquidations テーブル

| Column                | Type      | Options                         |
| --------------------- | --------- | ------------------------------- |
| user                  | reference | null: false, foreign_key: true  |
| product               | reference | null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :product
has_one :delivery_address

## delivery_addresses テーブル

| Column                | Type      | Options                         |
| --------------------- | --------- | ------------------------------- |
| postal_code           | string    | null: false                     |
| delivery_source_id    | integer   | null: false                     |
| city                  | string    | null: false                     |
| block                 | string    | null: false                     |
| building_name         | string    |                                 |
| phone_number          | string    | null: false                     |
| user                  | reference | null: false, foreign_key: true  |
| product               | reference | null: false, foreign_key: true  |
| liquidation           | reference | null: false, foreign_key: true  |