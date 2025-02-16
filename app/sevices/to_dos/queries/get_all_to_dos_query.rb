module ToDos
  module Queries
    class GetAllToDosQuery
      def call
        ToDo.all
      end
    end
  end
end
