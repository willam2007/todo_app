module ToDoLists
  module Queries
    class GetToDoListByIdQuery
      def initialize(id)
        @id = id
      end

      def call
        ToDoList.find(@id)
      end
    end
  end
end
