class AddPhotosToRentalUnits < ActiveRecord::Migration
  def change
    add_column :rental_units, :photo, :string, array: true
  end
end
