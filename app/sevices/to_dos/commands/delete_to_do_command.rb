module ToDos
  module Commands
    class DeleteToDoCommand
      def initialize(to_do_id)
        @to_do_id = to_do_id
      end

      def call
        todo = ToDo.find(@to_do_id)
        todo.destroy!
      end
    end
  end
end
