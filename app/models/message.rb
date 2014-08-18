class Message < ActiveRecord::Base

	# include ActiveAttr::Model

	# attribute :name
	# attribute :subject
	# attribute :content

	# validates_presence_of :name
	# validates_presence_of :subject
	# validates_length_of :content, :maximum => 500

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :name, :email, :subject, :body

	validates :name, :email, :subject, :body, :presence => true
	validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true

	def initialize(attributes = {})
    	attributes.each do |name, value|
      		send("#{name}=", value)
    	end
  	end

  def persisted?
    false
  end
end