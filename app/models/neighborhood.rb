class Neighborhood < ActiveRecord::Base
  validates :name, presence: true
end
