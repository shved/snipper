class SnippetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :my_snippets]

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
    @comments = @snippet.comments
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create(snippet_params.merge(user: current_user))

    if @snippet.errors.empty?
      flash[:success] = 'Your snippet saved successfully'
    else
      flash[:error] = @snippet.errors.full_messages.first
    end

    redirect_to :root
  end

  def my_snippets
    @snippets = Snippet.where(user: current_user)
    render :index
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :body)
  end
end
