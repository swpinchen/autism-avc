class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[show]
  def show
    @user = current_user
    @item = Item.new
    @items = policy_scope(Item).order(:start_date)
    authorize @user
  end
  def dashboard
    @items = Item.all
    @review = Review.new
    authorize current_user
  end
end
