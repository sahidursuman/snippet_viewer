class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :body
      t.boolean :is_private
      t.string :url

      t.timestamps null: false
    end
  end
end
