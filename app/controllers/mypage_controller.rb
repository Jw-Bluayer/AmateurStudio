class MypageController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params.require(:user).permit(:name, :place, :introduction, :images)
    @user.update_attributes(name: params[:user][:name], place: params[:user][:place], introduction: params[:user][:introduction], image: params[:user][:image])

    redirect_to "/mypage/#{@user.id}"
  end

end
