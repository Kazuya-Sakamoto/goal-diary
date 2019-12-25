# 製作経緯
『日々の生活の中に小さな成功体験を。』
## 詳細
日常は時間と共に経過していく。
私は、27歳から逆算で日々日記をつけています。
そのおかげで、現在は日々の日常から、一日一日を意識するようになりました。
目標に大きさは関係なく、それを意識するかしないかで、
人生の幸福度は大きく変わる。
少しでも日常の中で、何か目標に向き合いタスク管理をする。
それを共有ができ、逆算で計算し、かつ管理ができるサイトです。
### URL
http://18.176.181.116/

# 使用技術
- Ruby 2.5.1
- Rails 5.2.4
- Haml
- SCSS
- JavaScript 
- jQuery 
- ajax 非同期通信
- AWS EC2, S3, 自動デプロイ

# Function
- ログイン
- ログアウト
- 新規機登録
- 新規投稿
- 投稿編集
- 投稿削除
- プロフィール
- プロフィール編集
- いいね
- 逆算
- カレンダー
- pagination
- コメント機能
- 自動デプロイ
- カテゴリー

# Goal diary DB設計
## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index|
|email|string||null: false|
|password|string|null: false|
|profile|string|
|image|string|
|introduction|string|
|goal|string|null: false|
### Asociation
- has_many :diarys
- has_many :comments
- has_many :likes

## diarys テーブル
|Column|Type|Options|
|------|----|-------|
|goal|daterime|null: false|
|content|string|null: false|
|image|string|
|user_id|refrences|null: false, foregin_key :true|
|created_at|date|
### Asociation
- belongs_to: user
- has_many: comments
- has_many: likes
- has_many :likes, through: :likes

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refrences|null: false, foregin_key :true|
|goal_id|refrences|null: false, foregin_key :true|
|created_at|date|
|text|string||null: false|
### Asociation
- belongs_to :user
- belong_to :diary

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refrences|null: false, foregin_key :true|
|goal_id|refrences|null: false, foregin_key :true|
|created_at|date|
### Asociation
- belongs_to :user
- belong_to :diary
- belongs_to :comment



