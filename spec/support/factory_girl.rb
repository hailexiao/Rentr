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

  factory :rental_unit do
    address {
      "#{Faker::Address.street_address}, #{Faker::Address.city},
       #{Faker::Address.state_abbr}, #{Faker::Address.zip}"
     }
    number_of_bedrooms Random.rand(1..7)
    type_of_dwelling "Triple Decker"
    monthly_rent Random.rand(1500..3500)
    tenant
    landlord
    electric_utility
    gas_utility
    neighborhood
  end

  factory :electric_utility do
    name { Faker::Company.name }
  end

  factory :gas_utility do
    name { Faker::Company.name }
  end

  factory :neighborhood do
    name { Faker::Address.city }
  end
end
