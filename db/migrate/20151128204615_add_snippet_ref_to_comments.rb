class AddSnippetRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :snippet, index: true, foreign_key: true
  end
end
