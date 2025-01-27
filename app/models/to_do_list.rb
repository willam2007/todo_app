class ToDoList < ActiveRecord::Base
  attr_accessible :title, :user_id
  belongs_to :user

  validates :title, presence: true
end
