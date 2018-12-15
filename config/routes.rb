Rails.application.routes.draw do
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  resources :mypages, path: 'mypage'

  # これ必要な数とアクションでルーティングしないとrake routesがキモい
  # resources :transactions, path: 'transaction/buy/:item_id'

  resources :transactions, path: 'transaction/buy'
end
