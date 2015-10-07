class Bill < ActiveRecord::Base
  belongs_to :rental_unit

  validates :month, presence: true
  validates :month, numericality: { only_integer: true }

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true }
end
