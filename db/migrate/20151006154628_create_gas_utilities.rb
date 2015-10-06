class CreateGasUtilities < ActiveRecord::Migration
  def change
    create_table :gas_utilities do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :gas_utilities, :name, unique: true
  end
end
