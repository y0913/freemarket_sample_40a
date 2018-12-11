# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|tel|integer|null: false, unique: true|
|name|string|null: false|
|name_kana|string|null: false|
|post_number|integer|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string|-------|
|building_tel|integer|-------|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_year|integer|null: false|
|sequrity_code|integer|null: false|
|introduction|text|-------|
|avatar|varbinary|-------|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_many :reviews
- has_many :sns_credentials
- has_many :exhibit_items
- has_many :buy_items
- belongs_to :prefecture
- has_many :items
- has_many :trades
- has_many :trading_tables, through: :trades
- has_many :item_comments


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|string|-------|
|user_id|references|null: false, foreign_key: true|
|comment|text|-------|

### Association
- belongs_to :review, dependent: :destroy


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|uid|string|-------|
|provider|string|-------|

### Association
- belongs_to :user, dependent: :destroy


## exhibit_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|state|integer, default: 0|null: false|

### Association
- belongs_to :user, dependent: :destroy
- has_many :items, dependent: :destroy


## buy_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|state|integer, default: 0|null: false|

### Association
- belongs_to :user, dependent: :destroy
- has_many :items, dependent: :destroy


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|string|-------|

### Association
- has_many :users
- has_many :items


## item_commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, dependent: :destroy
- belongs_to :item, dependent: :destroy


## trading_tablesテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- has_many :trades
- has_many :users, through: :trades
- belongs_to :item


## tradesテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|trading_table_id|references|null: false, foreign_key: true|

### Association
- belongs_to :trading_table
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|state_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|postage_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|brand_id|references|null: false, foreign_key: true|
|likes_count|integer|-------|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :likes
- has_many :trading_tables
- belongs_to :user, dependent: :destroy
- belongs_to :prefecture
- belongs_to :buy_item
- belongs_to :exhibit_item
- belongs_to :state
- has_many :category_items
- has_many :categorys, through: :category_items
- belongs_to :delivery_day
- baelongs_to :profit
- has_many :images
- belongs_to :brand
- belongs_to :postage
- belongs_to :delivery_method
- belongs_to :size
- has_many :item_comments


## statesテーブル

|Column|Type|Options|
|------|----|-------|
|state|string|null: false|

### Association
- has_many :items


## category_itemsテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item, dependent: :destroy
- belongs_to :category


## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :category_items
- has_many :items, through: :category_items, dependent: :destroy
- belongs_to :size


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|size|string|null: false|

### Association
- has_many :items, dependent: :destroy
- has_many :categorys


## delivery_daysテーブル

|Column|Type|Options|
|------|----|-------|
|days|string|null: false|

### Association
- has_many :items, dependent: :destroy


## profitsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|delivery_cost|integer|null: false|
|profit|integer|null: false|

### Association
- has_many :items, dependent: :destroy


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item, dependent: :destroy


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items, dependent: :destroy


## postagesテーブル

|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|

### Association
- has_many :items, dependent: :destroy


## delivery_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- has_many :items, dependent: :destroy
