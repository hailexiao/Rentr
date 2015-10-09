class AddLatitudeAndLongitudeToRentalUnit < ActiveRecord::Migration
  def change
    add_column :rental_units, :latitude, :float
    add_column :rental_units, :longitude, :float
  end
end
