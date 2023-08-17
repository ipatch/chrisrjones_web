# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Article model
RSpec.describe Article do
  it 'tests that the factory is valid' do
    expect(build(:article)).to be_valid
  end

  # Association test
  # ensure Article model has a 1:m relationship with the Comment model
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  # validation tests
  # ensure columns title, text, & slug are present before saving
  # it { should validate_presence_of(:title) }
  it 'validates the presence of the title' do
    article = build(:article, title: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:title]).to include("can't be blank")
  end

  it 'validates the presence of the text' do
    article = build(:article, text: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:text]).to include("can't be blank")
  end

  it 'validates the presence of the slug' do
    article = build(:article, slug: '')
    expect(article).not_to be_valid
    expect(article.errors.messages[:slug]).to include("can't be blank")
  end

  it 'validates uniqueness of the slug' do
    article = create(:article)
    invalid_article = build(:article, slug: article.slug)
    expect(invalid_article).not_to be_valid
  end

  # it { should validate_presence_of(:text) }
  # it { should validate_presence_of(:slug) }

  describe '.recent' do
    it 'lists recent article first' do
      old_article = create(:article)
      newer_article = create(:article)
      expect(described_class.recent).to eq(
        [newer_article, old_article]
      )
      old_article.update_column :created_at, Time.zone.now
      expect(described_class.recent).to eq(
        [old_article, newer_article]
      )
    end
  end
end
