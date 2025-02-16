module ToDoLists
  module Queries
    class GetAllToDoListsQuery
      def call
        ToDoList.all
      end
    end
  end
end
