require 'rails_helper'

RSpec.describe RentalUnit, type: :model do
  it { should belong_to :tenant }
  it { should belong_to :landlord }
  # it { should belong_to :electric_utility }
  # it { should belong_to :gas_utility }
  # it { should belong_to :neighborhood }
  # it { should have_many :bills }

  it { should validate_presence_of :address }

  it { should validate_presence_of :number_of_bedrooms }

  it { should validate_numericality_of(:number_of_bedrooms).only_integer }
  it { should validate_numericality_of(:number_of_bedrooms).is_greater_than(0) }

  it { should validate_presence_of :type_of_dwelling }

  it { should validate_presence_of :monthly_rent }
  it { should validate_numericality_of(:monthly_rent).only_integer }
end
