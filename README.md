# Goal diary DB設計
## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index|
|email|string||null: false|
|password|string|null: false|
|profile|string|
|icon|string|
### Asociation
- has_many diarys
- belong_to space

## diarys テーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|content|string|
|image|string|
|user_id|refrences|null: false, foregin_key :true|
### Asociation
- belong_to: user
- belong_to: space

## space テーブル
|Column|Type|Options|
|------|----|-------|
|title|string
|content|string|
|image|string|
|user_id|refrences|null: false, foregin_key :true|
|diary|id|refrences|null: false, foregin_key :true|
### Asociation
- has_many :users
- has_many :diarys


<!-- ## diary_userテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|refrences|null: false, foregin_key :true|
|diary|id|refrences|null:false, foregin_key :true|
### Asociation
- belong_to :user
- belong_to :diary
 -->


