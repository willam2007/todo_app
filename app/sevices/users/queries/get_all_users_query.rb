module Users
  module Queries
    class GetAllUsersQuery
      def call
        User.all
      end
    end
  end
end
