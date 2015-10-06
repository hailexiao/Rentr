require 'rails_helper'

RSpec.describe Bill, type: :model do
  it { should validate_presence_of :month }
  it { should validate_numericality_of(:month).only_integer }

  it { should validate_presence_of :amount }
  it { should validate_numericality_of(:amount).only_integer }
end
