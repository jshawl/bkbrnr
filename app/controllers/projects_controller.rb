class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :update, :destroy, :edit]

  def index
    @user = User.find_by_username(params[:user_id])
    @projects = @user.projects
    respond_to do |format| 
      format.html
      format.json { render json: @projects }
    end
  end

  def show
    @user = User.find_by_username(params[:user_id])
    @comments = @project.comments
    @comment = Comment.new
    respond_to do |format| 
      format.html
      format.json { render json: @project }
    end
  end

  def edit
  end

  def update
    if @project.update( project_params.merge(user:current_user) )
      redirect_to user_project_path(@user,@project)
    end
  end

  def create
    @project = Project.new(project_params.merge(user:current_user))
    if @project.save
      redirect_to root_path 
    end
  end

  def destroy
    @project.destroy
    redirect_to user_projects_path(@user)
  end

  private

  def set_project
    @project = Project.find( params[:id] )
    @user = current_user
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
