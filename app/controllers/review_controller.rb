class ReviewController < ApplicationController
  def new
  end

  def create
    newReview = Review.new
    newReview.title = params[:title]
    newReview.content = params[:content]
    newReview.save

    redirect_to "/show/#{newReview.id}"
  end

  def destroy
    destroyReview = Review.find(params[:id])
    destroyReview.destroy

    redirect_to '/'
  end

  def index
    @listReview = Review.all
  end

  def show
    @showReview = Review.find(params[:id])
  end

  def edit
    @editReview = Review.find(params[:id])
  end

  def update
    updateReview = Review.find(params[:id])
    updateReview.title = params[:title]
    updateReview.content = params[:content]
    updateReview.save

    redirect_to "/show/#{updateReview.id}"
  end
end
