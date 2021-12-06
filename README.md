# itemsテーブル
| Column         | type       | option                        |
| -------------- | ---------- | ----------------------------- |
| item_name      | string     | null:false                    |
| image          | text       | null:false                    |
| explanation    | text       | null:false                    |
| category       | text       | null:false                    |
| status         | text       | null:false                    |
| delivery_fee   | integer    | null:false                    |
| delivery_place | text       | null:false                    |
| delivery_days  | text       | null:false                    |
| price          | integer    | null:false                    |
| user           | references | null:false, foreign_key: true | 

# association
belongs_to :user
has_one :buy

# buysテーブル
| Column       | type       | option                         |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| postal_code  | integer    | null: false                    |
| prefectures  | text       | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| call_number  | integer    | null: false                    |

# association
belongs_to :user
belongs_to :item

# usersテーブル
| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| dob                | date   | null: false               |
# association
has_many :items
has_many :buys