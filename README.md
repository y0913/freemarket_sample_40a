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
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|card_number|integer|null: false|
|expiration_date_month|integer|null: false|
|expiration_date_year|integer|null: false|
|sequrity_code|integer|null: false|
|introduction|text|-------|
|avatar|string|-------|
|birth_year|integer|-------|
|birth_month|integer|-------|
|birth_day|integer|-------|

### Association
- has_many :item_comments
- has_many :sns_credentials, dependent: :destroy
- has_one  :address
- has_many :items, dependent: :destroy
- has_many :transaction_users, dependent: :destroy
- has_many :transaction_comments, through: :transaction_users, dependent: :destroy
- has_many :rates
- has_many :likes


## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_number|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string|-------|
|building_tel|integer|-------|

### Association
- belongs_to :user
- belongs_to :prefecture


## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|rate|string|-------|
|user_id|references|null: false, foreign_key: true|
|comment|text|-------|

### Association
- belongs_to :user


## sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|uid|string|-------|
|provider|string|-------|

### Association
- belongs_to :user


## exhibit_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|state|integer, default: 0|null: false|

### Association
- belongs_to :user
- has_many :items, dependent: :destroy


## buy_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|state|integer, default: 0|null: false|

### Association
- belongs_to :user
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
- belongs_to :user
- belongs_to :item


## trading_tablesテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- has_many :trades, dependent: :destroy
- has_many :users, through: :trades, dependent: :destroy
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
|condition_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|postage_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|price|integer|null: false|
|brand_id|references|null: false, foreign_key: true|
|likes_count|integer|-------|
|category_id|references|null: false, foreign_key: true|

### Association
- has_many :likes, dependent: :destroy
- has_many :trading_tables, dependent: :destroy
- belongs_to :user
- belongs_to :prefecture
- belongs_to :buy_item
- belongs_to :exhibit_item
- belongs_to :condition
- has_many :category_items, dependent: :destroy
- has_many :categorys, through: :category_items
- belongs_to :delivery_day
- baelongs_to :profit
- has_many :images, dependent: :destroy
- belongs_to :brand
- belongs_to :postage
- belongs_to :delivery_method
- belongs_to :size
- has_many :item_comments


## conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|

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
|parent_id|integer|-------|

### Association
- has_many :category_items, dependent: :destroy
- has_many :items, through: :category_items, dependent: :destroy
- belongs_to :size


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|size|string|null: false|

### Association
- has_many :items
- has_many :categorys


## delivery_daysテーブル

|Column|Type|Options|
|------|----|-------|
|days|string|null: false|

### Association
- has_many :items


## profitsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|delivery_cost|integer|null: false|
|profit|integer|null: false|

### Association
- has_many :items


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## postagesテーブル

|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|

### Association
- has_many :items


## delivery_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|method|string|null: false|

### Association
- has_many :items
