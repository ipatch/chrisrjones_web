class Article < ActiveRecord::Base

	has_many :comments, dependent: :destroy

	# this file will hold the validations for the articles
	validates :title, presence: true, length: { minimum: 5 }
end
