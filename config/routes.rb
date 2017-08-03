Rails.application.routes.draw do

  get 'user/show'

  get 'user/new'

  get 'user/edit'

  get 'user/update'

  resources :posts
  get 'main/index'

  resources :profiles

  resources :mypage

  root 'main#index'

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
