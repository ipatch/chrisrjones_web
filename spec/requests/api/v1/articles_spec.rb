# frozen_string_literal: true

require 'rails_helper'

# NOTE: ipatch, can remove `, type: :request` rspec will infer correct type cuz dir structure, and loc of spec file.
RSpec.describe 'articles API'
# test hello api endpoint
describe 'GET /hello' do
  it 'returns hello message' do
    get '/api/hello'
    result = JSON(response.body)
    expect(result['message']).to eq('hello from ./app/controllers/api/articles_controller#hello')
  end

  it 'returns status code 200' do
    get '/api/hello'
    expect(response).to have_http_status(:success)
  end
end
