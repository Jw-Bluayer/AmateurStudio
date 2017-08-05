class HomeController < ApplicationController
 
 


  def index
    @posts = @user.present? ? @user.posts.all : Post.all
    @a_user = current_user

    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])


  end

   def photographer
   end


   def model
   end



  

end



