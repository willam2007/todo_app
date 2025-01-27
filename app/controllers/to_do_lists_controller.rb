class ToDoListsController < ApplicationController::Base
  def index
    @lists = ToDoList.all
    render json: @lists
  end

  def show
    @list = ToDoList.find(params[:id])
    render json: @list
  end

  def create
    @list = ToDoList.new(params[:to_do_list])
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end
end
