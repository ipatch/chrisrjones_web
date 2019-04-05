FactoryBot.define do
  factory :article do
    title { Faker::Lorem.word }
    text { Faker::Lorem.word }
    slug { Faker::Lorem.word }
  end
end
