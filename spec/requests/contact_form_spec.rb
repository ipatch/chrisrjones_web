# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ContactForms' do
  describe 'GET /contact' do
    it 'responds with a success status' do
      get '/contact'
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get '/contact/new'
      expect(response).to render_template(:new)
    end
  end
end
