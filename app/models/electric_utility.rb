class ElectricUtility < ActiveRecord::Base
  has_many :rental_units

  validates :name, presence: true
end
