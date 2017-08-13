class HomeController < ApplicationController

  def index
    @posts = @user.present? ? @user.posts.all : Post.all
    session[:conversations] ||= []
    @users = User.all
  end

  def photographer
    @job = User.where(job: "Photographer").take
    @posts = @user.present? ? @user.posts.all : Post.all

  end

  def model
    @job = User.where(job: "Model").take

    @posts = @user.present? ? @user.posts.all : Post.all
  end

end
