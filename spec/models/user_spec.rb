# frozen_string_literal: true

require 'rails_helper'

# Test suite for User model
RSpec.describe User do
  # Association test
  # ensure User model has a 1:m relationship with the Article model
  it { is_expected.to have_many(:articles) }
  # Validation tests
  # ensure email and password_digest are present before save
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }
end
