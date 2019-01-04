FactoryBot.define do
  factory :item do
    name                {'商品名'}
    description         {'商品説明です'}
    postage
    delivery_method
    category
    prefecture
    delivery_day
    price               {500}
    condition
    user
    item_state
  end

end
