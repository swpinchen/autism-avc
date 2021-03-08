class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[show]
  def show
    @user = current_user
    @item = Item.new
    @items = Item.all
    authorize @user
  end
end
