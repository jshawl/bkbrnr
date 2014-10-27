class CommentsController < ApplicationController
  def create
    @project = Project.find( params[:project_id] )
    @comment = Comment.new( comment_params.merge( user: current_user, project_id: params[:project_id] ) )
    if @comment.save
      redirect_to user_project_path( current_user, @project)
    end
  end

  def destroy
    @project = Project.find( params[:project_id] )
    @comment = Comment.find( params[:id] )
    if @comment.user_id == current_user.id || @comment.user_id == @project.user_id
     @comment.destroy
     redirect_to user_project_path( current_user, @project )
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
