# frozen_string_literal: true

# represents an article in the application
class Article < ApplicationRecord # :nodoc:
  # DEPRECATED: rails >= v4.x attr_accessible :slug
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :recent, -> { order(created_at: :desc) }

  # specify relationship between articles & attachments
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy

  # user singluar form of model when using 'belongs_to'
  # SEE: http://stackoverflow.com/questions/16257116
  belongs_to :user

  # specify the relationship for the meta_description
  # has_one :meta_description

  def to_param
    slug
  end

  def json_response(object, status = :ok)
    render json: object, status:
  end
end
