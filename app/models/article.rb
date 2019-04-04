class Article < ActiveRecord::Base
  # DEPRECATED: rails ≥ v4.x attr_accessible :slug

	# specify relationship between articles & attachments
	has_many :attachments, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { minimum: 5 }
  # validates :created_by
	validates_presence_of :slug

	# user singluar form of model when using 'belongs_to'
	# SEE: http://stackoverflow.com/questions/16257116
	belongs_to :user

	# specify the relationship for the meta_description
	# has_one :meta_description

	def to_param
		slug
	end


  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
