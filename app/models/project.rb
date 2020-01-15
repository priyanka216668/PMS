class Project < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :resources
  has_many :users, through: :resources
  has_many :todos
  accepts_nested_attributes_for :resources


  def new_todos_count
    todos.where(status: 'new').count
  end

  def in_progress_todos_count
    todos.where(status: 'in_progress').count
  end

  def done_todos_count
    todos.where(status: 'done').count
  end

  def developers_count
    resources.count
  end

  def as_json(options={})
    super(
          only: [ :name, :id],
          methods: [:new_todos_count, :in_progress_todos_count, :done_todos_count, :developers_count]
        )
  end
end
