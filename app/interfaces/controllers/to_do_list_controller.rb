class ToDoListsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create, :update, :destroy ]

  def index
    @lists = ToDoLists::Queries::GetAllToDoListsQuery.new.call
    render json: @lists
  end

  def show
    @list = ToDoLists::Queries::GetToDoListByIdQuery.new(params[:id]).call
    render json: @list
  end

  def create
    dto = ToDoListDto.new(to_do_list_params)

    if dto.valid?
      list = ToDoLists::Commands::CreateToDoListCommand.new(dto).call
      render json: list, status: :created
    else
      render json: dto.errors, status: :unprocessable_entity
    end
  end

  def update
    dto = ToDoListDto.new(to_do_list_params)

    if dto.valid?
      list = ToDoLists::Commands::UpdateToDoListCommand.new(params[:id], dto).call
      render json: list
    else
      render json: dto.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ToDoLists::Commands::DeleteToDoListCommand.new(params[:id]).call
    head :no_content
  end

  private

  def to_do_list_params
    params.require(:to_do_list).permit(:title, :description, :user_id)
  end
end
