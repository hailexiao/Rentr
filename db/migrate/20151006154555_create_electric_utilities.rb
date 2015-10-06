class CreateElectricUtilities < ActiveRecord::Migration
  def change
    create_table :electric_utilities do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :electric_utilities, :name, unique: true
  end
end
