class ToDosController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    @todos = ToDo.all
    render json: @todos
  end

  def show
    @todo = ToDo.find(params[:id])
    render json: @todo
  end


  def create
    @todo = ToDo.new(to_do_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:description, :is_done, :priority, :to_do_list_id)
  end
end
