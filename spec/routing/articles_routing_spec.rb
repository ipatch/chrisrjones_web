# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ArticlesController, type: :controller do

  describe "GET #hello" do
    it 'responds with 200 status code' do
      expect(response.code).to eq('200')
    end

    it 'should route to articles hello' do
      get :hello, params: { use_route: 'articles/hello' }
      expect(response.status).to eq(200)
    end

    # TODO: fixme
    # it 'should route to hello' do
    #   expect(get '/articles/hello').to
    #   route_to('articles#hello')
    # end
  end
end
