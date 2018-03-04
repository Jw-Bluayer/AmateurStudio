Rails.application.routes.draw do

  get 'home/photographer'
  get 'home/model'
  get 'home/index'
  get 'conversations/show'

  #해시태그
  get '/posts/hashtag/:name', to:'posts#hashtags'

  #리뷰

  get '/user/:user_id/reviews/new' => 'reviews#new'
  get '/user/:user_id/reviews/create' => 'reviews#create'
  get '/user/:user_id/reivews/destroy/:review_id' => 'reviews#destroy'

  #다른 유저의 마이페이지
  get 'users/:id' => 'user#showothers'

  post 'post/:post_id/like' => 'likes#like_toggle'

  resources :posts


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
