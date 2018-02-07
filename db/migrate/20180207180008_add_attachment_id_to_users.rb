class AddAttachmentIdToUsers < ActiveRecord::Migration
  def change
    add_column :attachments, :article_id, :integer
  end
end