class HomeController < ApplicationController
before_action :authenticate_user!

  def index
    @posts = @user.present? ? @user.posts.all : Post.all
    session[:conversations] ||= []
    @users = User.all
  end

  def photographer
  end

  def model
  end
end
