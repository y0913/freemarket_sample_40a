Rails.application.routes.draw do
  root 'items#index'
  resources 'items'
  get 'mypage/card' => 'mypages#card'
  resources :mypages, path: 'mypage'
end
