class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :body
      t.boolean :is_private
      t.string :slug

      t.timestamps null: false
    end
  end
end
