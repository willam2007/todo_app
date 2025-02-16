module ToDos
  module Commands
    class CreateToDoCommand
      def initialize(dto)
        @dto = dto
      end

      def call
        ToDo.create!(
          description:    @dto.description,
          is_done:        @dto.is_done,
          to_do_list_id:  @dto.to_do_list_id
        )
      end
    end
  end
end
