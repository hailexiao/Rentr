class CreateRentalUnits < ActiveRecord::Migration
  def change
    create_table :rental_units do |t|
      t.string :address, null: false
      t.integer :number_of_bedrooms, null: false
      t.string :type_of_dwelling, null: false
      t.integer :monthly_rent, null: false
      t.belongs_to :tenant
      t.belongs_to :landlord
      t.belongs_to :electric_utility, null: false
      t.belongs_to :gas_utility, null: false
      t.belongs_to :neighborhood, null: false

      t.timestamps null: false
    end

    add_index :rental_units, :address, unique: true
  end
end
