Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  #ユーザーマイページ用のルーティング
  resources :users, :only => [:show]

  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
end
