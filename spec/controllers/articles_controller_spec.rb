# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ArticlesController do
  describe '#index' do
    subject { get :index }

    it 'returns success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns proper json' do
      create_list(:article, 2)
      subject
      #
      # DEBUG
      # pp json
      #
      # FIXME recent func does not properly order
      Article.recent.each_with_index do |article, index|
        expect(json_data[index]['attributes']).to eq(
          'title' => article.title,
          'text' => article.text,
          'slug' => article.slug
        )
      end
    end
  end

  # describe '#empty' do
  #  it 'should return success response' do
  #    get :empty
  #    expect(response).to have_http_status(:ok)
  #  end

  #  #it 'should return proper json' do
  #  #  get :empty
  #  #  json = JSON.parse(response.body)
  #  #  #
  #  #  # NOTE: useful for printing json repsones
  #  #  # pp json
  #  #  #
  #  #  json_data = json[:data]
  #  #  expect(json_data.length).to eq(1)
  #  #end
  # end

  # describe '#hello' do
  #  it 'should return success response' do
  #    get :hello
  #    expect(response).to have_http_status(:ok)
  #  end

  #  # it 'should return proper json' do
  #  #   get :hello
  #  #   json = JSON.parse(response.body)
  #  #   pp json
  #    # json_data = json[:data]
  #    # expect(json_data.length).to eq(1)
  #  # end
  # end

  # TODO: fixme, API can't return response unless authenticated
  # describe '#index' do
  #   it 'should return success repsonse' do
  #     get :index
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
