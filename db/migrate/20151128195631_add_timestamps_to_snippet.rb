class AddTimestampsToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :created_at, :datetime
    add_column :snippets, :updated_at, :datetime
  end
end
