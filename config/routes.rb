Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'diaries#index'
  # root to: 'diaries#top'
  resources :diaries do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update]
  get "/diaries/category/:category_id", to: "diaries#category"
end
