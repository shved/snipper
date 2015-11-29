class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.merge(user: current_user, snippet_id: params[:snippet_id]))

    if @comment.errors.empty?
      flash[:success] = 'Comment added successfully'
    else
      flash[:error] = @comment.errors.full_messages.first
    end

    redirect_to snippet_path(params[:snippet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
