# Comment only has create functionality and lives on job_path
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    flash.notice = 'Comment Created!' if @comment.save
    redirect_to job_path(@comment.job_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
