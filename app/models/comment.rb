class Comment < ActiveRecord::Base
  # TODO: flesh out Comment model to make a little more robust
  belongs_to :article
end
