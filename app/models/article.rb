class Article < ActiveRecord::Base

	# attr_accessible :slug

	# rails 4 doesn't use attr_accessible, it uses strong parameters
	# defined in the controller

	has_many :comments, dependent: :destroy

	# specify relationship for articles / attachments
	has_many :attachments, dependent: :destroy

	# this file will hold the validations for the articles
	validates :title, presence: true, length: { minimum: 5 }

	# def slug
	# 	title.downcase.gsub(" ", "-")
	# end
	validates_presence_of :slug

	# user singluar form of model when using 'belongs_to'
	# see this SO thread, http://stackoverflow.com/questions/16257116
	belongs_to :user

	# specify the relationship for the meta_description
	# has_one :meta_description

	def to_param
		slug
	end
end