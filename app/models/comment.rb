# frozen_string_literal: true

class Comment < ApplicationRecord # :nodoc:
  # TODO: flesh out Comment model to make a little more robust
  belongs_to :article
end
