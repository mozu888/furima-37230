# itemsテーブル
| Column            | type       | option                        |
| ----------------- | ---------- | ----------------------------- |
| item_name         | string     | null:false                    |
| explanation       | text       | null:false                    |
| category_id       | integer    | null:false                    |
| status_id         | integer    | null:false                    |
| delivery_fee_id   | integer    | null:false                    |
| prefecture_id     | integer    | null:false                    |
| delivery_days_id  | integer    | null:false                    |
| price             | integer    | null:false                    |
| user              | references | null:false, foreign_key: true | 

# association
belongs_to :user
has_one :buy

# buysテーブル
| Column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

# association
belongs_to :user
belongs_to :item
has_one :delivery

# deliveriesテーブル
| Column        | type    | option                         |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    |
| prefecture_id | integer | null: false                    |
| municipality  | string  | null: false                    |
| address       | string  | null: false                    |
| building      | string  |                                |
| call_number   | string  | null: false                    |

# association
belongs_to :buy

# usersテーブル
| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| dob                | date   | null: false               |

# association
has_many :items
has_many :buys