class UsersController < ApplicationController
  def index
    @user = current_user || User.new
    @projects = Project.all
    @project = Project.new
  end
end