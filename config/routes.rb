Rails.application.routes.draw do

  resources :posts do
    resources :comments, only: [:create, :destroy]
   end

  get 'home/photographer'
  get 'home/model'
  get 'home/index'
  get 'conversations/show'


  #다른 유저의 마이페이지 
  get 'users/:id' => 'user#showothers'


  resources :posts

  resources :profiles

  resources :mypage

  root 'home#index'

  resources :user

  devise_for :users ,:path => 'accounts'
  resources :users do
    resources :posts
  end

  resources :friendships

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
