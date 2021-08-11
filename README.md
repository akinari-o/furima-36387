##テーブル設計


## users テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | ---------------------| ------------------------------ |
| nickname                    | string               | null: false                    |
| email                       | string               | null: false, unique: true      |
| encrypted_password          | string               | null: false                    |
| last_name                   | string               | null: false                    |
| first_name                  | string               | null: false                    |
| last_name_kana              | string               | null: false                    |
| first_name_kana             | string               | null: false                    |
| birthday                    | date                 | null: false                    |

### Association

- has_many :product_sells
- has_many :user_buy_sells

## product_buys テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| postal_code                 | string               | null: false                    |
| prefecture_id               | integer              | null: false                    |
| municipalities              | string               | null: false                    |
| address                     | string               | null: false                    |
| building_name               | string               |                                |
| telephone_number            | string               | null: false                    |
| user_buy_sells              | references           | null: false, foreign_key: true |

### Association

- belongs_to :user_buy_sell 


## product_sells テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| product_name                | string               | null: false                    |
| description                 | text                 | null: false                    |
| category_id                 | integer              | null: false                    |
| condition_id                | integer              | null: false                    |
| delivery_fee_id             | integer              | null: false                    |
| prefecture_id               | integer              | null: false                    |
| day_to_ship_id              | integer              | null: false                    |
| price                       | integer              | null: false                    |

### Association

- belongs_to :user
- belongs_to :user_buy_sell


## user_buy_sells テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| user                        | references           | null: false, foreign_key: true |
| product_sell                | references           | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :product_buy
- has_one :product_sell