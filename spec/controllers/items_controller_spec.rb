require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe '#new' do
  end
  describe '#create' do
    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end
    it 'renders the :create template' do
      post :create,params:{item: attributes_for(:item)}
      expect(response).to render_template :create
    end
    it 'インスタンス変数が適切かどうか'
    it 'モデルの増減'
    it 'リダイレクト'
  end

end
