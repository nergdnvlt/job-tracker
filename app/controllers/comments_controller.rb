# Comment only has create functionality and lives on job_path
class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to job_path(@comment.job)
  end

  private

  def comment_params
    params.require.permit(:body)
  end
end
