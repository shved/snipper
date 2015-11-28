class AddTimestampsToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :created_at, :timestamp
    add_column :snippets, :updated_at, :timestamp
  end
end
