class ElectricUtility < ActiveRecord::Base
  validates :name, presence: true
end
