module ToDoLists
  module Commands
    class CreateToDoListCommand
      def initialize(dto)
        @dto = dto
      end

      def call
        ToDoList.create!(
          title:      @dto.title,
          user_id:    @dto.user_id
        )
      end
    end
  end
end
