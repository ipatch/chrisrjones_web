# frozen_string_literal: true

require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Article model
  it { should have_many(:articles) }
  # Validation tests
  # ensure email and password_digest are present before save
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
