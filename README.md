# README

# 題名
TRAVEL SHARE

# 概要
ユーザー登録をすることによって、国ごとに写真投稿をできるようになり、一覧も閲覧できるようになる。
また、写真に対してコメントもできるので、新たな情報を得ることもでき、”綺麗！”など評価も得ることができる。また、投稿したい国が存在しない場合は、作成することもできる。

# URL

# テスト用アカウント
## ユーザー１
mail:aaa@gmail.com
pass:111111

## ユーザー２
mail:bbb@gmail.com
pass:111111

# 制作背景（意図）
近年SNSの発達によって、様々なジャンルの写真や情報が共有されている。私自身、海外旅行が好きで色々と現地に行ったが、振り返るとどこの国か忘れてしまうことが多い。国ごとに今までの旅行の思い出や、情報を共有できたらいいなと思い制作。

# DEMO
## トップページ（ログイン、サインアップ画面）
![toppage](https://user-images.githubusercontent.com/77385479/109965603-864d9400-7d32-11eb-8831-3cc65576e9d2.jpg)
ログイン、サインアップページへ遷移するボタンがある

## トップページ（ログイン後）
![afterlogin](https://user-images.githubusercontent.com/77385479/109968337-e98cf580-7d35-11eb-8235-ba92b31591ec.jpg)
ログイン時は、ログアウトボタンがある  
新規に国の部屋を作るボタンがある  
ログイン時はユーザーの名前をクリックするとユーザ情報編集ページに遷移する




## 一覧ページ
![index](https://user-images.githubusercontent.com/77385479/109965878-e8a69480-7d32-11eb-942d-fe2ba719a34d.jpg)
写真のタイトルとテキストを入力するフォームがある  
写真を選択するフォームがある  
国の部屋を削除するボタンがある  
作成された国名をクリックするとその国の部屋を表示する  
国の部屋には投稿された写真が一覧表示されている  
写真にはタイトル、テキスト、投稿時刻、投稿したユーザーの名前が表示されている  
写真をクリックすると、詳細ページへ遷移する  

## 詳細ページ
![show](https://user-images.githubusercontent.com/77385479/109967584-f3622900-7d34-11eb-8256-e7c6d366f4c5.jpg)
投稿した内容が全て表示されている  
投稿を削除するボタンがある  
写真に対してコメントできるフォームがある  
コメントを一覧表示  

# 工夫したポイント
背景には旅行や海外ということがイメージつきやすくするため、地球儀のイラストを採用した。  
また、国ごとに投稿を集約することで、これから旅行する国の情報を簡単に収集できる。  
投稿する際に、敢えてタイトルと説明で分けることで、投稿者が何を伝えたいのかはっきりさせることができる。  


# 使用技術（開発環境）

## バックエンド
Ruby, Ruby on rails

## フロントエンド
html, css

## データベース
Mysql, SequelPro

## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
Google Mapの導入  
投稿時に、位置も紐付けできるようにする  
詳細画面に置いてmapの表示  
ユーザー詳細画面の実装  
ユーザー詳細画面において、そのユーザーの投稿を一覧表示  
いいね機能  

# DB設計

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
