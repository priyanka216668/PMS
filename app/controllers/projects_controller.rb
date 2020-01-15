class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_resource, except: [:index, :new, :create, :reports]

  def index
    if current_user.present?
      @projects = current_user.role == 'admin' ? Project.where(created_by_id: current_user.id).all.as_json :
        current_user.resources.collect(&:user_resources)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @project = Project.new
    @project.resources.build
    
    render 'new.js'
  end

  def create
    project = Project.new(project_params)
    project.created_by_id = current_user.id
    project.save
  end

  def show
    if current_user.present?
      @result = []
      project_developers = @project.resources.collect(&:user)
      project_developers.each do |dev|
        todos = dev.assigned_todos.where(project_id: @project.id).order(status: :asc)#.group_by(&:status)
        tasks = {}
        tasks["new"] = todos.where(status: "new").collect(&:title)
        tasks["in_progress"] = todos.where(status: "in_progress").collect(&:title)
        tasks["done"] = todos.where(status: "done").collect(&:title)
        #todos.each{ |k,v| tasks << {k => v.collect(&:title)} }
        @result << {name: dev.name, tasks: tasks}
      end
    else
      redirect_to new_user_session_path
    end
  end

  def reports
    @report_data = {}
    Project.all.order(name: :asc).each do |project|
      done_count = project.done_todos_count
      new_count = project.new_todos_count
      progress_count = project.in_progress_todos_count
      @report_data[project.name] = [['Done', done_count],
        ['In Progess', progress_count], ['New', new_count]] if done_count + new_count + progress_count > 0
    end
  end


  private
  def load_resource
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :created_by_id, resources_attributes:[Resource.attribute_names])
  end
end