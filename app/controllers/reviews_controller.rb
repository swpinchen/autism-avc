class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @reviews = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @item = Item.find(params[:item_id])
    authorize @review
  end

  def create
    @review = Review.create(review_params)
    @item = Item.find(params[:item_id])
    @review.item = @item
    # @review.user = current_user
    authorize @review
    if @review.save
      if @review.rating == 1
        # @happy = Item.where(reviews.rating)
        @reviewed_items = Item.all.select{|item| item.reviews.any?}
        @happy = @reviewed_items.sort_by{ |item| item.reviews.last.rating }.last
        redirect_to item_path(@happy)
      else
        redirect_to items_path
      end
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :date)
  end
end
