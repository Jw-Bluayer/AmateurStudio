class HomeController < ApplicationController

  def index
    @posts = @user.present? ? @user.posts.all : Post.all.page(params[:page]).order(created_at: :desc)
    session[:conversations] ||= []
    @users = User.all
  end

  def photographer
    @job = User.where(job: "Photographer")
   
  end

  def model
    @job = User.where(job: "Model")
  end




end
