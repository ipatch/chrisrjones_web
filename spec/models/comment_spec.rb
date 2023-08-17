# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Comment model
RSpec.describe Comment do
  # Association test
  # ensure a comment record belongs to a single article record
  it { is_expected.to belong_to(:article) }
  # Validation test
  # ensure column name is present before saving
  # TODO: flesh out test after Comment model has been updated
  # it { should validate_presence_of(:) }
end
