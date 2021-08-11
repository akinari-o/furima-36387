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
| postal_code                 | integer              | null: false                    |
| prefectures :category_id    | integer              | null: false                    |
| municipalities              | string               | null: false                    |
| address                     | string               | null: false                    |
| building_name               | string               |                                |
| telephone_number            | string               | null: false                    |      
| user_buy_sells              | references           | null: false, foreign_key: true |

### Association

- has_one :user_buy_sell 


## product_sells テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| product_name                | string               | null: false                    |
| description                 | text                 | null: false                    |
| category_id                 | integer              | null: false                    |
| condition :category_id      | integer              | null: false                    |
| delivery_fee :category_id   | integer              | null: false                    |
| shipping_area :category_id  | integer              | null: false                    |
| day_to_ship :category_id    | integer              | null: false                    |
| price                       | integer              | null: false                    |

### Association

- belongs_to :user
- has_one :user_buy_sell


## user_buy_sells テーブル

| Column                      | Type                 | Options                        |
| --------------------------- | -------------------- | ------------------------------ |
| user                        | references           | null: false, foreign_key: true |
| product_sell                | references           | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product_buy
- belongs_to :product_sell