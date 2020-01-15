class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :assigned_to, class_name: 'User'
  belongs_to :created_by,  class_name: 'User'

end
