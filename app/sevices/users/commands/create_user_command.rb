module Users
  module Commands
    class CreateUserCommand
      def initialize(user_dto)
        @user_dto = user_dto
      end

      def call
        User.create!(
          name:  @user_dto.name,
          email: @user_dto.email
        )
      end
    end
  end
end
