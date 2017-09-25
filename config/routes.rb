Rails.application.routes.draw do
  root 'home#index'

  resources :posts do
    resources :comments, only: [:create, :destroy]
   end

  get 'home/photographer'
  get 'home/model'
  get 'home/index'
  get 'conversations/show'

  #다른 유저의 마이페이지
  get 'users/:id' => 'user#showothers'

  get 'review/index'
  get 'review/new'
  get 'review/show/:id' => "review#show"
  post 'review/add'


  resources :posts

  resources :profiles

  resources :mypage

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
