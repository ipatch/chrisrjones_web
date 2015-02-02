class Attachment < ActiveRecord::Base

	def uploaded_file=(incoming_file)
		self.filename = incoming_file.original_filename
		self.content_type = incoming_file.content_type
		self.data = incoming_file.read
	end

	def filename=(new_filename)
		write_attributes("filename", sanitize_filename(new_filename))
	end

	private

	def sanitize_filename(filename)
		just_filename = File.basename(filename)
		just_filename.gsub(/[^\w\.\-]/, '_')
	end
end
