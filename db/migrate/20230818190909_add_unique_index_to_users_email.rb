# frozen_string_literal: true

# Migration to add a unique index to the email column in the users table
class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
  end
end
