# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

require "csv"

CSV.foreach('db/brand.csv') do |row|
  Brand.find_or_create_by(name: row[0])
end

CSV.foreach('db/category.csv') do |row|
  Category.find_or_create_by(name: row[0], parent_id: row[1], how_size: row[2])
end

# CSV.foreach('db/category_item.csv') do |row|
#   CategoryItem.find_or_create_by(item_id: row[0], category_id: row[1])
# end

CSV.foreach('db/condition.csv') do |row|
  Condition.find_or_create_by(condition: row[0])
end

CSV.foreach('db/delivery_day.csv') do |row|
  DeliveryDay.find_or_create_by(day: row[0])
end

CSV.foreach('db/postage.csv') do |row|
  Postage.find_or_create_by(burden: row[0])
end

CSV.foreach('db/delivery_method.csv') do |row|
  DeliveryMethod.find_or_create_by(method: row[0], postage_id: row[1])
end

# CSV.foreach('db/image.csv') do |row|
#   Image.find_or_create_by(image: row[0], item_id: row[1])
# end

CSV.foreach('db/item_state.csv') do |row|
  ItemState.find_or_create_by(state: row[0])
end

CSV.foreach('db/prefecture.csv') do |row|
  Prefecture.find_or_create_by(prefecture: row[0])
end

CSV.foreach('db/size.csv') do |row|
  Size.find_or_create_by(size: row[0], sizing: row[1])
end

CSV.foreach('db/transaction_state.csv') do |row|
  TransactionState.find_or_create_by!(state: row[0])
end

# CSV.foreach('db/item.csv') do |row|
#   Item.find_or_create_by!(name: row[0], description: row[1], condition_id: row[2], user_id: row[3], postage_id: row[4], delivery_method_id: row[5], prefecture_id: row[6], delivery_day_id: row[7], price: row[8], brand_id: row[9], likes_count: row[10], category_id: row[11], item_state_id: row[12], size_id: row[13])
# end

# CSV.foreach('db/user.csv') do |row|
#   u = User.new(nickname: row[0], email: row[1], encrypted_password: row[2], tel: row[3], first_name: row[4], last_name: row[5], first_name_kana: row[6], last_name_kana: row[7], card_number: row[8], expiration_date_month: row[9], expiration_date_year: row[10], sequrity_code: row[11], introduction: row[12], avatar: row[13], birth_year: row[14], birth_month: row[15], birth_day: row[16])
#   u.save(validate: false)
# end

# CSV.foreach('db/address.csv') do |row|
#   Address.find_or_create_by(user_id: row[0], post_number: row[1], prefecture_id: row[2], city: row[3], address: row[4])
# end
