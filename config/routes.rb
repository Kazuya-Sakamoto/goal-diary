Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    resources :comments, only: :create
  end
  resources :users, only: :show
  resources :likes, only: [:create, :destroy]
end
