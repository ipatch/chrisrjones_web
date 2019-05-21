# frozen_string_literal: true

class AddAdminUserToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :admin_user, :boolean, default: false
  end
end
