module ToDos
  module Queries
    class GetToDoByIdQuery
      def initialize(to_do_id)
        @to_do_id = to_do_id
      end

      def call
        ToDo.find(@to_do_id)
      end
    end
  end
end
