class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @items = Item.joins(:reviews).where("rating = 4")
    @review = Review.new
  end
end
