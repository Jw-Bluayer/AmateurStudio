class HomeController < ApplicationController

  def index
    @posts = @user.present? ? @user.posts.all : Post.all.page(params[:page]).order(created_at: :desc)
    session[:conversations] ||= []
    @users = User.all
  end

  def photographer
    @posts = @user.present? ? @user.posts.all : Post.all.order(created_at: :desc)
    @job = User.where(job: "Photographer").take
  end

  def model
    @posts = @user.present? ? @user.posts.all : Post.all.order(created_at: :desc)
    @job = User.where(job: "Model").take
  end
end
