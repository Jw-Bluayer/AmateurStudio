Rails.application.routes.draw do
<<<<<<< HEAD
=======


  resources :posts do
    resources :comments, only: [:create, :destroy]
   end

>>>>>>> 8014f1ede0a717423d274ede422314bcf0c4b20a
  get 'home/photographer'
  get 'home/model'
  get 'home/index'
  get 'conversations/show'

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
