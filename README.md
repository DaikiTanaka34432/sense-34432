# README
・アプリ名: sense!
・概要(このアプリでできることを書いて下さい)
芸人さん達がセルフプロデュースしているグッズ等をまとめて閲覧できて購入することができる。
グッズのセンスをきっかけに芸人さんを知ってもらう。
・本番環境(デプロイ先 テストアカウント＆ID)
・制作背景(意図)
⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
・工夫したポイント
・使用技術(開発環境)
・課題や今後実装したい機能
・DB設計  

# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| user_check         | string  | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_read     | string  | null: false               |
| first_name_read    | string  | null: false               |
| birthday           | date    | null: false               |
| telephone          | string  | null: false               |
| office_id          | integer |                           |
| career             | date    |                           |
| introduction       | text    |                           |


### Association
has_many :items
has_many :likes
has_many :orders


## items テーブル
| Column              | Type       | Options                         |
| ------------------- | ---------- |-------------------------------- |
| name                | string     | null: false                     |
| profile             | text       | null: false                     |
| category_id         | integer    | null: false                     |
| delivery_fee_id     | integer    | null: false                     |
| prefecture_id       | integer    | null: false                     |
| shipment_days_id    | integer    | null: false                     |
| fee                 | integer    | null: false                     |
| user                | references | null: false, foreign_keys: true |

### Association
belongs_to :user
has_many :likes
has_one :order


## likes テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |

### Association
belongs_to :item
belongs_to :user



## orders テーブル
| Column           | Type       | Options                         |
| ---------------- | ---------  |-------------------------------- |
| item             | references | null: false, foreign_keys: true |
| user             | references | null: false, foreign_keys: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses
| Column            | Type       | Options                         |
| ----------------- | ---------  |-------------------------------- |
| postal_code       | string     | null: false                     |
| prefecture_id     | integer    | null: false                     |
| city              | string     | null: false                     |
| house_number      | string     | null: false                     |
| house_name        | string     |                                 |
| telephone         | string     | null: false                     |
| purchase          | references | null: false, foreign_keys: true |

### Association
belongs_to :order