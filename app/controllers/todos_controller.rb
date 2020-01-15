class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :load_resource, except: [:index,:new]
  
  # def index
  #   if current_user.present?
  #     @projects = Project.where(created_by_id: current_user.id).all.as_json
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end

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


  private
  def load_resource
    @project = Project.find(params[:project_id])
  end
  def todo_params
    params.require(:todo).permit(:type, :title, :description, :status, :assigned_to_id, :created_by_id, :project_id)
  end
end