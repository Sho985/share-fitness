Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  #ユーザーマイページ用のルーティング
  resources :users, only: [:show] do
    member do
      get 'calendar'
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
