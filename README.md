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
- has_many :items
- has_many :orders

## Addresses テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| postal_code       | string     | null: false                 |
| shipping_region_id| integer    | null: false                 |
| city              | string     | null: false                 |
| street            | string     | null: false                 |
| building          | string     |                             |
| phone_number      | string     | null: false                 |
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order

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
| status_id             | integer    | null: false                 |
| user                  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## Orders テーブル
| Column            | Type       | Options                     |
| ----------------- | ---------- | --------------------------- |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address