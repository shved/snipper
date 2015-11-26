class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :body
    end
    add_index :snippets, :title
  end
end
