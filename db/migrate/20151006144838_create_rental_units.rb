class CreateRentalUnits < ActiveRecord::Migration
  def change
    create_table :rental_units do |t|
      t.string :address, null: false
      t.integer :number_of_bedrooms, null: false
      t.string :type_of_dwelling, null: false
      t.integer :monthly_rent, null: false
      t.integer :tenant_id, null: false
      t.integer :landlord_id, null: false
      t.integer :electric_utility_id, null: false
      t.integer :gas_utility_id, null: false
      t.integer :neighborhood_id, null: false

      t.timestamps null: false
    end

    add_index :rental_units, :address, unique: true
  end
end
