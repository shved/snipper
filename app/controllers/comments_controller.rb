class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params.merge(snippet_id: params[:snippet_id]))
    redirect_to snippet_path(params[:snippet_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
