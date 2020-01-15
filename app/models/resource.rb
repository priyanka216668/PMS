class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def name
    project.name
  end
 
  def id
    project_id
  end
 
  def new_todos_count
    project.todos.where(status: 'new').count
  end
 
  def in_progress_todos_count
    project.todos.where(status: 'in_progress').count
  end
 
  def done_todos_count
    project.todos.where(status: 'done').count
  end
 
  def user_resources(options={})
    as_json(except: [:is_active, :created_at, :updated_at],
          methods: [:name, :id, :done_todos_count, :new_todos_count, :in_progress_todos_count]
        )
  end
end
