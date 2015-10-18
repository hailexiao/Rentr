class RentalUnit < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :landlord
  belongs_to :electric_utility
  belongs_to :gas_utility
  belongs_to :neighborhood
  has_many :bills, dependent: :destroy

  mount_uploaders :photos, ApartmentUploader

  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true

  validates :number_of_bedrooms, presence: true
  validates :number_of_bedrooms,
    numericality: { only_integer: true,
                    greater_than: 0 }

  validates :type_of_dwelling, presence: true

  validates :monthly_rent, presence: true
  validates :monthly_rent,
    numericality: { only_integer: true,
                    greater_than: 0 }

  def street_address
    self.address.split(',')[0]
  end

  def city_state_zip
    address_array = self.address.split(',')
    if address_array.last.to_i !=0
      return address_array.last(3).join
    else
      return address_array.last(2).join
    end
  end

  def self.average_bills
    self.all.map { |unit| unit.bills.average(:amount).to_i }
  end

  def monthly_bills
    (1..12).map { |m| self.bills.where(month: m).average(:amount).to_i }
  end


end
