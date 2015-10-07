class RentalUnit < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :landlord
  belongs_to :electric_utility
  belongs_to :gas_utility
  belongs_to :neighborhood
  has_many :bills, dependent: :destroy

  geocoded_by :address

  validates :address, presence: true

  validates :number_of_bedrooms, presence: true
  validates :number_of_bedrooms,
    numericality: { only_integer: true,
                    greater_than: 0 }

  validates :type_of_dwelling, presence: true

  validates :monthly_rent, presence: true
  validates :monthly_rent,
    numericality: { only_integer: true }

  after_validation :geocode

end
