class ToDosController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create, :update, :destroy ]
  def index
    @todos = ToDos::Queries::GetAllToDosQuery.new.call
    render json: @todos
  end

  def show
    @todo = ToDos::Queries::GetToDoByIdQuery.new(params[:id]).call
    render json: @todo
  end

  def create
    todo_dto = ToDoDto.new(to_do_params)

    if todo_dto.valid?
      @todo = ToDos::Commands::CreateToDoCommand.new(todo_dto).call
      render json: @todo, status: :created
    else
      render json: todo_dto.errors, status: :unprocessable_entity
    end
  end

  def update
    todo_dto = ToDoDto.new(to_do_params)

    if todo_dto.valid?
      @todo = ToDos::Commands::UpdateToDoCommand.new(params[:id], todo_dto).call
      render json: @todo
    else
      render json: todo_dto.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ToDos::Commands::DeleteToDoCommand.new(params[:id]).call
    head :no_content
  end

  private

  def to_do_params
    params.require(:to_do).permit(:description, :is_done, :priority, :to_do_list_id)
  end
end
