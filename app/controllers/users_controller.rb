class UsersController < ApplicationController
  def index
    @user = current_user || User.new
    @projects = Project.all
    @project = Project.new
  end
  def show
    @user = User.find_by_username( params[:id] )
    @projects = @user.projects 
    respond_to do |format| 
      format.html
      format.json { render json: @projects }
    end
  end
end