class AddMetaDescriptionToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :meta_description, :string
  end
end
