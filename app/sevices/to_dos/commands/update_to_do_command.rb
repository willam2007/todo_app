module ToDos
  module Commands
    class UpdateToDoCommand
      def initialize(to_do_id, dto)
        @to_do_id = to_do_id
        @dto = dto
      end

      def call
        todo = ToDo.find(@to_do_id)
        todo.update!(
          description:    @dto.description,
          is_done:        @dto.is_done,
          to_do_list_id:  @dto.to_do_list_id
        )
        todo
      end
    end
  end
end
