class Bill < ActiveRecord::Base
  validates :month, presence: true
  validates :month, numericality: { only_integer: true }

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true }
end
