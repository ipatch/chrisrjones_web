require 'rails_helper'

# Test suite for the Article model
RSpec.describe Article, type: :model do
  # Association test
  # ensure Article model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # validation tests
  # ensure columns title, text, & slug are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:text) }
  it { should validate_presence_of(:slug) }
end
