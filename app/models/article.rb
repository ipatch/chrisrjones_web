class Article < ActiveRecord::Base

	# attr_accessible :slug

	# rails 4 doesn't use attr_accessible, it uses strong parameters
	# defined in the controller

	has_many :comments, dependent: :destroy

	# this file will hold the validations for the articles
	validates :title, presence: true, length: { minimum: 5 }

	# def slug
	# 	title.downcase.gsub(" ", "-")
	# end
	validates_presence_of :slug

	def to_param
		slug
	end
end
