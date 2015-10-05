require 'factory_girl'
require 'faker'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :tenant do
    sequence(:email) { |n| "tenant#{n}@example.com" }
    # first_name Faker::Name.name.split(' ')[0]
    # last_name Faker::Name.name.split(' ')[1]
    password 'password'
    password_confirmation 'password'
  end

  factory :landlord do
    sequence(:email) { |n| "landlord#{n}@example.com"}
    # first_name Faker::Name.name.split(' ')[0]
    # last_name Faker::Name.name.split(' ')[1]
    password 'password'
    password_confirmation 'password'
  end
end
