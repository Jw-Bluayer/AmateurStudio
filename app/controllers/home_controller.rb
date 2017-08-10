class HomeController < ApplicationController

  def index
    @posts = @user.present? ? @user.posts.all : Post.all
    session[:conversations] ||= []
    @users = User.all
  end

  def photographer
    @posts = @user.present? ? @user.posts.all : Post.all
    @job = User.where(job: "Photographer").take
  end

  def model
    @posts = @user.present? ? @user.posts.all : Post.all
    @job = User.where(job: "Model").take
  end
end
