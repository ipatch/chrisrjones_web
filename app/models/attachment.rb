# frozen_string_literal: true

class Attachment < ActiveRecord::Base
	belongs_to :user
	require "base64"
	# validate :sanitize_filename
  attr_accessor :file

  def uploaded_file(incoming_file)
    if incoming_file
      self.filename = sanitize_filename(incoming_file.original_filename)
      self.content_type = incoming_file.content_type
      self.file_contents = incoming_file.read
    else
      raise "missing file"
    end
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  protected

  def sanitize_filename(filename)
    return File.basename(filename)
  end
end
