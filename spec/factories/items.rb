FactoryBot.define do
  factory :item do

    name                {'商品名'}
    description         {'商品説明です'}
    category_id         {1}
    postage_id          {1}
    delivery_method_id  {2}
    prefecture_id       {3}
    delivery_day_id     {2}
    price               {2}
    condition_id        {2}
    user_id             {1}
  end

#  後で書きます

  # factory :abeshi, class: User do
  #   id                {1}
  #   nickname          {'あべし'}
  #   email             {'abeshi@gmail.com'}
  # end
end
