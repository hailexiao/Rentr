require 'rails_helper'

RSpec.describe Neighborhood, type: :model do
  it { should validate_presence_of :name }
end
