# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| encrypted_password | string              | null:false              |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_data         | string              | null: false             |




### Association

* has_many :items

* has_many :orders




## items table

| Column                         | Type       | Options           |
|--------------------------------|------------|-------------------|
| name                      | string     | null: false       |
| category                  | string     | null: false       |
| sales-status              | string     | null: false       |
| info                      | string     | null: false       |
| shipping_free-status      | string     | null: false       |
| prefecture-id             | string     | null: false       |
| scheduled_delivert        | string     | null: false       |
| price                     | integer    | null: false       |
| user                      | references | foreign_key: true |





### Association
- belongs_to :user
- has_one :order



## address table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal_code | string     | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| addresses   | string     | null: false       |
| building    | string     | null: false       |
| phone_number| integer    | null: false       |
| order       | references | foreign_key: true |




### Association

- belongs_to :order


## orders table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address