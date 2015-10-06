require 'rails_helper'

RSpec.describe Landlord, type: :model do
  it { should validate_presence_of :email }

  it { should have_many :rental_units }
end
