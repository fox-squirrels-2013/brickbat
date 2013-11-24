FactoryGirl.define do
  factory :user do
    uid '123456'
    username 'testuser'
    token '123123123123'
    secret '321123321123'
  end

  factory :post do
    user
    title Faker::Lorem.word
    body Faker::Lorem.sentence
  end

  factory :response do
    user
    post
    body Faker::Lorem.sentence
  end
end