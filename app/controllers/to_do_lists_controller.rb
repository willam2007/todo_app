class ToDoListsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    @lists = ToDoList.all
    render json: @lists
  end


  def show
    @list = ToDoList.find(params[:id])
    render json: @list
  end


  def create
    @list = ToDoList.new(to_do_list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description, :user_id)
  end
end
