class AddMetaDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :meta_description, :string
  end
end
