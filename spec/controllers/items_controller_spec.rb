require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # describe '#new' do
  # end
  # describe '#create' do
  #   it 'has a 200 status code' do
  #     expect(response.status).to eq(200)
  #   end
  #   it 'renders the :create template' do
  #     post :create,params:{item: attributes_for(:item)}
  #     expect(response).to render_template :create
  #   end
  #   it 'インスタンス変数が適切かどうか'
  #   it 'モデルの増減'
  #   it 'リダイレクト'
  # end

  describe '#update' do
    # context 'アイテム出品者と同じユーザーが#updateしようとした場合'
      it 'updateする' do
        @user = create(:user)
        @item = create(:item)
        @item.name = "変更しました"
        binding.pry
        patch :update, params: { id: @item.id, name: @item.name }, session: {}
        @result = Item.find(1)
        expect(@result.name).to eq("変更しました")
      end
    # context 'アイテム出品者と違うユーザーが#updateしようとした場合'
    #   it 'updateしない'
    end

end
