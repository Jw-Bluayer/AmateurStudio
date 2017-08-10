Rails.application.routes.draw do


  get 'home/photographer'
  get 'home/model'
  get 'home/index'
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
