class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create, :update, :destroy ]


   def index
    @users = Users::Queries::GetAllUsersQuery.new.call
    render json: @users
  end


  def show
    @user = Users::Queries::GetUserByIdQuery.new(params[:id]).call
    render json: @user
  end


  def create
    user_dto = UserDto.new(user_params)
    if user_dto.valid?
      user = Users::Commands::CreateUserCommand.new(user_dto).call
      render json: user, status: :created
    else
      render json: user_dto.errors, status: :unprocessable_entity
    end
  end


  def update
    user_dto = UserDto.new(user_params)
    if user_dto.valid?
      user = Users::Commands::UpdateUserCommand.new(params[:id], user_dto).call
      render json: user
    else
      render json: user_dto.errors, status: :unprocessable_entity
    end
  end


  def destroy
    Users::Commands::DeleteUserCommand.new(params[:id]).call
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
