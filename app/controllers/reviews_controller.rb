class ReviewsController < ApplicationController
  def new
    @user_id = params[:user_id]
  end

  def create



    @review = Review.new
    @review.title = params[:input_title]
    @review.content = params[:input_content]
    @review.user_id = params[:user_id]
    @review.save

    redirect_to "/user/#{params[:user_id]}"
  end

  def edit
  end

  def update
  end

  def destroy
    @review = Review.find(params[:review_id])
    @review.destroy

    redirect_to "/user/#{params[:user_id]}"
  end
end
