class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :delete]
  def index
    
  end

  def show

  end
  def create
    @project = Project.new(project_params.merge(user:current_user))
    if @project.save
      redirect_to root_path 
    end
  end


  private
  def set_project
    @project = Project.find( params[:id] )
  end
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
