class ItemsController < ApplicationController
  before_action :set_task, only: [:show, :update]

  def index
    # @tasks = policy_scope(Task)
    @items = Item.all
  end

  def show
  end

  # def new
  #   @item = Item.new
  # end

  # def create
  #   @item = Item.new
  #   @user = current_user
  # end

  private

  def set_task
    @item = Item.find(params[:id])
    authorize @item
  end
end
