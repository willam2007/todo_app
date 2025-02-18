module ToDoLists
  module Commands
    class UpdateToDoListCommand
      def initialize(id, dto)
        @id  = id
        @dto = dto
      end

      def call
        list = ToDoList.find(@id)
        list.update!(
          title:       @dto.title,
          user_id:     @dto.user_id
        )
        list
      end
    end
  end
end
