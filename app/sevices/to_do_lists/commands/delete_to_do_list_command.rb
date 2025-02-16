module ToDoLists
  module Commands
    class DeleteToDoListCommand
      def initialize(id)
        @id = id
      end

      def call
        list = ToDoList.find(@id)
        list.destroy!
      end
    end
  end
end
