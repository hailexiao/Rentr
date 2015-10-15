class AddPhotosToRentalUnits < ActiveRecord::Migration
  def change
    add_column :rental_units, :photos, :string, array: true
  end
end
