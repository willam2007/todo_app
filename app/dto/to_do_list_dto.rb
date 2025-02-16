class ToDoListDto
  include ActiveModel::Model

  attr_accessor :title, :user_id

  validates :title, presence: true
end
