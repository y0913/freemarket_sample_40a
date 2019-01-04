Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  root 'items#index'

  resources 'items' do
    collection do
      get 'search' => 'items#search'
    end
  end


  post 'rate/:id' => 'rates#create'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/card/create' => 'mypages#buy'
  get 'mypage/logout' => 'mypages#logout'
  get 'mypage/listing' => 'mypages#listing'
  get 'mypage/in_progress' => 'mypages#in_progress'
  get 'mypage/completed' => 'mypages#completed'
  get 'mypage/purchase' => 'mypages#purchase'
  get 'mypage/purchased' => 'mypages#purchased'
  get 'mypage/deliver_address' => 'mypages#deliver_address'
  resources :mypages, path: 'mypage'
  delete 'items/:id' =>'items#destroy'
  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction' do
    collection do
      get 'buy/:id' => 'transactions#buy'
      get 'bought/:id' => 'transactions#bought'
      post 'pay/:id' => 'transactions#pay'
      get 'done/:id' => 'transactions#done'
      get 'order_status/:id' => 'transactions#order_status'
      post ':id' => 'transactions#condition'
    end
  end
end
