Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  get 'mypage/logout' => 'mypages#logout'
  get 'transaction/buy/done' => 'transactions#bought'
  resources :mypages, path: 'mypage'

  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction/buy'
end
