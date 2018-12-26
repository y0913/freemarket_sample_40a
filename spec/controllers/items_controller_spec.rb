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

  # 後で書きます


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

#   describe 'DELETE#destroy' do
#     before do
#       @item = FactoryBot.build(:item)
#       @user = User.new(id: 1, nickname: "abeshi", email: "abeshi@gmail.com")
#       if @item.user_id == @user.id
#         @item.destroy
#     end
#   end
# end
#     it '商品削除できるか' do
#       expect(@item.delete).to change{Item.count}.by(1)
#     end
#   end

# delete :destroy, id:
#         expect(response).to eq{""}


  #   it "商品削除できるか" do
  #     expect{@item.delete}.to change{Item.count}.by(-1)
  #     expect =(item.delete).to be_truthy

  # end


#     end
#   end






