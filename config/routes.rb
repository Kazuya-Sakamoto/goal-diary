Rails.application.routes.draw do
  devise_for :users
  root to: 'diaries#index'
  resources :diaries do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
end
