module Users
  module Commands
    class UpdateUserCommand
      def initialize(user_id, user_dto)
        @user_id  = user_id
        @user_dto = user_dto
      end

      def call
        user = User.find(@user_id)
        user.update!(
          name:  @user_dto.name,
          email: @user_dto.email
        )
        user
      end
    end
  end
end
