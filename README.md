# データベース設計

## Users テーブル
| Column             | Type       | Options                     |
| ------------------ | ---------- | --------------------------- |
| nickname           | string     | null: false                 |
| email              | string     | null: false, unique: true   |
| encrypted_password | string     | null: false                 |
| last_name          | string     | null: false                 |
| first_name         | string     | null: false                 |
| last_name_kana     | string     | null: false                 |
| first_name_kana    | string     | null: false                 |
| birth_date         | date       | null: false                 |

### Association
- has_many :addresses
- has_many :items
- has_many :orders

## Addresses テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| postal_code       | string     | null: false                 |
| prefecture_id     | integer    | null: false                 |
| city              | string     | null: false                 |
| street            | string     | null: false                 |
| building          | string     |                             |
| phone_number      | string     | null: false                 |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prefecture

## Items テーブル
| Column                | Type       | Options                     |
| --------------------- | ---------- | --------------------------- |
| name                  | string     | null: false                 |
| description           | text       | null: false                 |
| category_id           | integer    | null: false                 |
| price                 | integer    | null: false                 |
| shipping_fee_payer_id | integer    | null: false                 |
| shipping_region_id    | integer    | null: false                 |
| shipping_day_id       | integer    | null: false                 |
| status                | integer    | null: false, default: 0     |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :shipping_fee_payer
- belongs_to :shipping_region
- belongs_to :shipping_day
- has_one :order

## Orders テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user