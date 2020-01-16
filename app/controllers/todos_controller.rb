class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_resource, except: [:new]
  
  def index
    if current_user.present?
      @todos = current_user.assigned_todos.where(project_id: @project.id).all.as_json
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @todo = Todo.new
    render 'new.js'
  end

  def create
    todo = @project.todos.new(todo_params)
    todo.created_by_id = current_user.id
    todo.save
  end

  def show

  end

  def edit
    render 'edit.js'
  end
 
  def update
    todo = @todo.update(todo_params)
  end

  private
  def load_resource
    if params[:id]
      @todo = Todo.find(params[:id])
    end
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:type, :title, :description, :status, :assigned_to_id, :created_by_id, :project_id)
  end
end