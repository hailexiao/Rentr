class Bill < ActiveRecord::Base
  belongs_to :rental_unit

  validates :month, presence: true
  validates :month, numericality: { only_integer: true,
                                    greater_than: 0, less_than: 13 }

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0 }
end
