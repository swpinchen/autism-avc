class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update]

  def index
    # @tasks = policy_scope(Task)
    @tasks = Task.all
  end

  def show
  end

  # def new
  #   @task = Task.new
  # end

  # def create
  #   @task = Task.new
  #   @user = current_user
  # end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end
end
