class ToDo < ActiveRecord::Base
  attr_accessible :description, :is_done, :todo_list_id
  belongs_to :to_do_list
end
