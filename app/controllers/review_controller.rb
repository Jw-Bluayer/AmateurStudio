class ReviewController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
  end

  def show
    @review = Review.find(params[:id])
  end

  def add
    review = Review.new
    review.worktitleReview = params[:worktitle]
    review.placeReview = params[:place]
    review.dayReview = params[:day]
    review.satisForworkReview = params[:satisForwork]
    review.satisForworkerReview = params[:satisForworker]
    review.evalReview = params[:eval]
    review.save

    redirect_to "/review/index"
  end
end
