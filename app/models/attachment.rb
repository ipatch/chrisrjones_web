# frozen_string_literal: true

class Attachment < ApplicationRecord # :nodoc:
  belongs_to :user
  require 'base64'
  # validate :sanitize_filename
  attr_accessor :file

  def uploaded_file(incoming_file)
    raise 'missing file' unless incoming_file

    self.filename = sanitize_filename(incoming_file.original_filename)
    self.content_type = incoming_file.content_type
    self.file_contents = incoming_file.read
  end

  def filename=(new_filename)
    self['filename'] = sanitize_filename(new_filename)
  end

  protected

  def sanitize_filename(filename)
    File.basename(filename)
  end
end
