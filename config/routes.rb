Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  
  resources :users, only: [:show] do
    get :calendar, on: :member 
    get :graph, on: :member  
    resource :relationships, only: [:create, :destroy]
    resources :bodyweights, only: [:index, :create ,:destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  #質問機能
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

end
