# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    name { 'MyString' }
    email { 'MyString' }
    subject { 'MyString' }
    body { 'MyText' }
  end
end
