Rails.application.routes.draw do

  get 'home/photographer'
  get 'home/model'
  get 'home/index'
  get 'conversations/show'

  #해시태그
  get '/posts/hashtag/:name', to:'posts#hashtags'


  #다른 유저의 마이페이지
  get 'users/:id' => 'user#showothers'

  post 'post/:post_id/like' => 'likes#like_toggle'
  
  resources :posts

  resources :profiles

  resources :mypage

  root 'home#index'

  resources :user

  devise_for :users ,:path => 'accounts'
  resources :users do
    resources :posts do
        resources :likes
    end
  end

  resources :friendships

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
  
end
