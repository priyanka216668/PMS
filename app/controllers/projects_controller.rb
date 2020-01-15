class ProjectsController < ApplicationController

  def index
    if current_user.present?
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
    # health_insurance = HealthInsurance.new(health_params)
    # pos_user = health_insurance.user
    # if pos_user.present? && pos_user.relationship_manager.present? && health_insurance.save!
    #   save_member_other_attribitues(health_insurance)
    #   return render json: {message: 'Record Created Successfully'}, status: :ok
    # end
    # render json: { message: 'Unable to create record'}, status: :ok
  end


  private
  def project_params
    params.require(:project).permit(:name, :description, :created_by_id, reources_attributes:[Resource.attribute_names])
  end
end