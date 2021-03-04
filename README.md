# README

# 題名
TRAVEL SHARE

# 概要
ユーザー登録をすることによって、国ごとに写真投稿をできるようになり、一覧も閲覧できるようになる。
また、写真に対してコメントもできるので、新たな情報を得ることもでき、”綺麗！”など評価も得ることができる。また、投稿したい国が存在しない場合は、作成することもできる。

# URL

# テスト用アカウント
ユーザー１
mail:aaa@gmail.com
pass:111111

ユーザー２
mail:bbb@gmail.com
pass:111111

# 利用方法






## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many : comments

## countries テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :country_users
- has_many :users, through: country_users
- has_many :messages

## country_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :country
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :country
- belongs_to :user
- has_many : comments

## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| user_id    | references | null: false |
| message_id | references | null: false |
| text       | text       | null: false |

- belongs_to :user
- belongs_to :message
