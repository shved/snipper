class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create(snippet_params)
    if @snippet.errors.empty?
      redirect_to :root
    else
      render :noting
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :body)
  end
end
