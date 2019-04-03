class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :created_by
      t.string :slug # the permalink for a blog post

      t.timestamps null: false
    end
  end
end
