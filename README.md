##テーブル設計


## users テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | ---------------------| ------------------------------ |
| nickname                    | string               | null: false                    |
| email                       | string               | null: false                    |
| encrypted_password          | string               | null: false                    |
| name                        | string               | null: false                    |
| name_kana                   | string               | null: false                    |
| birthday :category_id       | integer              | null: false                    |

### Association

- has_many :product_sells
- has_many :product_buys
- has_many :user_buy_sells

## product_buys テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| postal_code                 | integer              | null: false                    |
| prefectures                 | integer 　　　　　　　　| null: false                    |
| municipalities              | string               | null: false                    |
| address                     | string               | null: false                    |
| building_name               | string               |                                |
| telephone_number            | integer              | null: false                    |      

### Association
- belongs_to :user
- has_one :user_buy_sell


## product_sells テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| product_name                | string               | null: false                    |
| description                 | text                 | null: false                    |
| category :category_id       | integer  | null: false                    |
| condition :category_id     | integer  | null: false                    |
| delivery_fee :category_id  | integer  | null: false                    |
| shipping_area :category_id | integer  | null: false                    |
| days_to_ship :category_id  | integer  | null: false                    |
| price                      | integer              | null: false                    |

### Association

- belongs_to :user
- has_one :user_buy_sell


## user_buy_sells

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| user_id                     | references           | null: false, foreign_key: true |
| product_buys_id             | references           | null: false, foreign_key: true |
| product_sell_id             | references           | null: false, foreign_key: true |

### Association
-belongs_to :user
- belongs_to :product_buy
- belongs_to :product_sell