class CreateTokenBlacklist < ActiveRecord::Migration[5.2]
  def change
    create_table :token_blacklists do |t|
      t.string :jwt_token
      t.datetime :expiring_at
    end
    add_index :token_blacklists, :jwt_token
  end
end
