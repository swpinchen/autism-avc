class ItemsController < ApplicationController
  before_action :set_task, only: %i[show update]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = policy_scope(Item)
    @review = Review.new
  end

  def show
  end

  def new
    @item = Item.new
    # authorize @item if current_user.owner
  end

  def create
    @item = Item.create(item_params)
    @item.user = current_user
    # authorize @item
    if @item.save
      redirect_to item_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :start_date, :category, :details, :end_date, :recurring, :completed,
                                 :editable, :deletable, :photo)
  end

  def set_task
    @item = Item.find(params[:id])
    authorize @item
  end
end
