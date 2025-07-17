# データベース設計

## Users テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| email             | string     | null: false, unique: true   |
| password_digest   | string     | null: false                 |
| nickname          | string     | null: false                 |
| last_name         | string     | null: false                 |
| first_name        | string     | null: false                 |
| last_name_kana    | string     | null: false                 |
| first_name_kana   | string     | null: false                 |
| birth_date        | date       | null: false                 |

### Association
- has_many :addresses
- has_many :items, foreign_key: 'seller_id'
- has_many :comments

## Addresses テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| postal_code       | string     | null: false                 |
| prefecture        | string     | null: false                 |
| city              | string     | null: false                 |
| street            | string     | null: false                 |
| building          | string     |                             |
| phone_number      | string     | null: false                 |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## Items テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| name              | string     | null: false                 |
| description       | text       | null: false                 |
| category          | string     | null: false                 |
| price             | integer    | null: false                 |
| image_url         | string     |                             |
| shipping_fee_payer| integer    | null: false                 |
| shipping_region   | string     | null: false                 |
| shipping_days     | string     | null: false                 |
| status            | integer    | null: false, default: 0     |
| seller            | references | null: false, foreign_key: { to_table: :users } |

### Association
- belongs_to :seller, class_name: 'User'
- has_many :comments

## Comments テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| content           | text       | null: false                 |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user