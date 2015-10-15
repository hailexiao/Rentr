class AddUtilitiesIncludedToRentalUnits < ActiveRecord::Migration
  def change
    add_column :rental_units, :utilities_included, :boolean, default: false
  end
end
