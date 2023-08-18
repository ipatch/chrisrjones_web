# frozen_string_literal: true

# Migration to add a unique index to the slug column in the articles table
class AddUniqueIndexToArticlesSlug < ActiveRecord::Migration[6.1]
  def change
    add_index :articles, :slug, unique: true
  end
end
