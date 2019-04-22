require 'rails_helper'

# Test suite for the Article model
RSpec.describe Article, type: :model do
  it 'should test that the factory is valid' do
    expect(FactoryBot.build :article).to be_valid
  end
  # Association test
  # ensure Article model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # validation tests
  # ensure columns title, text, & slug are present before saving
  # it { should validate_presence_of(:title) }
  it 'should validate the presence of the title' do
    article = FactoryBot.build :article, title: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:title]).to include("can't be blank")
  end

  it 'should validate the presence of the text' do
    article = FactoryBot.build :article, text: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:text]).to include("can't be blank")
  end

  it 'should validate the presence of the slug' do
    article = FactoryBot.build :article, slug: ''
    expect(article).not_to be_valid
    expect(article.errors.messages[:slug]).to include("can't be blank")
  end

  it 'should validate uniqueness of the slug' do
    article = FactoryBot.create :article
    invalid_article = FactoryBot.build :article, slug: article.slug
    expect(invalid_article).not_to be_valid
  end

  # it { should validate_presence_of(:text) }
  # it { should validate_presence_of(:slug) }

  describe '.recent' do
    it 'should list recent article first' do
      old_article = create :article
      newer_article = create :article
      expect(described_class.recent).to eq(
        [ newer_article, old_article ]
      )
      old_article.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [ old_article, newer_article ]
      )
    end
  end
end
