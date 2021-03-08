class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[show]
  def show
    @user = current_user
    authorize @user
  end
end
