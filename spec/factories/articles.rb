FactoryBot.define do
  factory :article do
    # NOTE: create a title with at least 5 chars
    title { Faker::Lorem.characters(5) }
    text { Faker::Lorem.word }
    # NOTE: slug / permalink must be unique
    slug { Faker::Lorem.unique.word }
  end
end
