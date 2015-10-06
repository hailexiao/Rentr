class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :rental_unit

  validates :email, presence: true
  validates :email, format: { with: /.+@.+\..+/i,
                              message: "Please enter a valid email address." }
end
