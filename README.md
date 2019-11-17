# Goal diary DB設計
## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index|
|email|string||null: false|
|password|string|null: false|
|profile|string|
|image|string|
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
- has_many :likes

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



