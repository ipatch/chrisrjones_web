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
  end
end
