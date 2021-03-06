Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: {   registrations: 'users/registrations',
  sessions: 'users/sessions' }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  resources :users, only: [:show] do
    get :calendar, on: :member 
    get :graph, on: :member  
    get :following, on: :member 
    get :followers, on: :member 
    get :timeline, on: :member 
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
