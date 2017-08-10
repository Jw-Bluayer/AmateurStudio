class FriendshipsController < ApplicationController


	def show
		@users = User.all
	end

	def create
	  return false if current_user.friendships.where(friend_id: params[:friend_id]).exists?
	  @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
    	  flash.now[:notice] = "Friend requested."
    	  redirect_to root_url
    	else
    	  flash.now[:error] = "Unable to request friendship."
    	  redirect_to root_url
    	end
	end

	def update
	@friendship = Friendship.find_by(friend_id: params[:id])
	@friendship.update_all(accepted: true)
	  if @friendship.save
	    redirect_to root_url, notice: "Successfully confirmed friend!"
	  else
	    redirect_to root_url, notice: "Sorry! Could not confirm friend!"
	  end
	end

	def destroy
	  @friendship = Friendship.find_by(friend_id: params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
	  redirect_to root_url
	end

end
