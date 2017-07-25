Rails.application.routes.draw do

  get 'main/index'

  resources :profiles

  resources :mypage

  root 'main#index'

  devise_for :users

  resources :friendships

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
