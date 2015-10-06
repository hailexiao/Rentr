class Landlord < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rental_units

  validates :email, presence: true
  validates :email, format: { with: /.+@.+\..+/i,
                              message: "Please enter a valid email address."}
end
