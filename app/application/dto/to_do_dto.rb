class ToDoDto
  include ActiveModel::Model

  attr_accessor :description, :is_done, :to_do_list_id

  validates :description, presence: true
end
