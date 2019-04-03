class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles, :user_id, :integer
  	add_column :users, :user_id, :integer
  	add_foreign_key :articles, :users #, dependent: :delete
  end
end
