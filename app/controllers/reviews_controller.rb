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
    @item.last_opened = DateTime.now
    @item.save!
    # @review.user = current_user
    authorize @review
    if @review.save
      if @review.rating == 1
        # @happy = Item.where(reviews.rating)
        redirect_to item_path(@item)
      else
        redirect_to item_path(@item)
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
