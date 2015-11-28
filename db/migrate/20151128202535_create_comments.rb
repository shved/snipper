class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
