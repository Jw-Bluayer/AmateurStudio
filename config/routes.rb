Rails.application.routes.draw do

  resources :profiles

  resources :mypage

  root 'home#index'

  devise_for :users

  resources :friendships

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
