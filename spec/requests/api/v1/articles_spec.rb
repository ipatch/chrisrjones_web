# frozen_string_literal: true

require 'rails_helper'

describe 'articles API', type: :request do
  it 'sends an individual response' do
    get '/api/hello', nil, \
      { 'HTTP_ACCEPT' => 'application/vnd.contacts.v1' }
    expect(response).to have_http_status(:ok)
    json = JSON.response.parsed_body
    expect(json['repsonse']).to eq 'hello from ./app/controllers/api/articles_controller#hello'
    # Etc.
  end
end
