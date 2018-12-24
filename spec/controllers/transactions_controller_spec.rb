require 'rails_helper'

describe TransactionsController, type: :controller do
  describe 'POST #pay' do

    before do
      @item = Item.new(id: 10, name: "あべし", description: "あべし", condition_id: 1, user_id: 1, postage_id: 1, delivery_method_id: 1, prefecture_id: 1, delivery_day_id: 1, price: 500, brand_id: 1, likes_count: 10, category_id: 1, item_state_id: 1, size_id: 1)
      @user = User.find(1)
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      @charge = Payjp::Charge.create(
        :amount => @item.price,
        :customer => "#{@user.customer_id}",
        :currency => 'jpy',
      )
      @item.item_state_id = 3
      @item.save
    end

    it "購入金額が正しいかを確認" do
      expect(@charge[:amount]).to eq @item.price
    end

    it "購入後、アイテムの状態(item_state_id)が売却済(3)になることを確認" do
      expect(@item.item_state_id).to eq 3
    end

  end
end
