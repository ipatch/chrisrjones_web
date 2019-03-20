class Article < ActiveRecord::Base
	# attr_accessible :slug
	# rails 4 doesn't use attr_accessible, it uses strong parameters
	# defined in the controller

	# specify relationship between articles & attachments
	has_many :attachments, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :created_by, :title, presence: true, length: { minimum: 5 }
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
