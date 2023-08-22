# frozen_string_literal: true

# a class for holding messages sent via the contact form
class Message < ApplicationRecord
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Model # Include this module to provide necessary Active Model methods
  include ActiveModel::Attributes
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :body

  validates :name, :email, :subject, :body, presence: true
  validates :email, format: { with: /.+@.+\..+/ }, allow_blank: true

  # def initialize(attributes = {})
  #   attributes.each do |name, value|
  #     send("#{name}=", value)
  #   end
  # end

  def persisted?
    false
  end
end
