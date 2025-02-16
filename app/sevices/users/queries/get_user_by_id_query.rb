module Users
  module Queries
    class GetUserByIdQuery
      def initialize(user_id)
        @user_id = user_id
      end

      def call
        User.find(@user_id)
      end
    end
  end
end
