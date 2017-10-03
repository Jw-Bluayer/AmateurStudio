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

  get 'new'         => 'review#new'       # 글 작성 페이지
  post 'create'     => 'review#create'    # 글 작성
  get 'destroy/:id' => 'review#destroy'   # 글 삭제
  get 'index'       => 'review#index'     # 모든 글 보기
  get 'show/:id'    => 'review#show'      # 특정 글 보기
  get 'edit/:id'    => 'review#edit'      # 글 편집 페이지
  post 'update'     => 'review#update'    # 글 편집


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
