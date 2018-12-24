require 'rails_helper'
describe Transaction do
  describe 'POST #pay' do
    it '購入後、item_state_idが3(購入済)になること' do
      @item = Item.new(name: "あべし", description: "あべし", condition_id: 1, user_id: 1, postage_id: 1, delivery_method_id: 1, prefecture_id: 1, delivery_day_id: 1, price: 500, brand_id: 1, likes_count: 10, category_id: 1, item_state_id: 1, size_id: 1)
      @item.item_state_id = 3
      @item.save
      expect(@item.item_state_id).to eq 3
    end
  end
end
