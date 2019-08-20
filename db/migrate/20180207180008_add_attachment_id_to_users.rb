# frozen_string_literal: true

class AddAttachmentIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :article_id, :integer
  end
end
