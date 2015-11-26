class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create(snippet_params)
  end

  private

  def snippet_params
    params.require!(:new_snippet_form).permit(:title, :body)
  end
end
