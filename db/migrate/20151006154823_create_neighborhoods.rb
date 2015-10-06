class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.integer :boundaries

      t.timestamps null: false
    end

    add_index :neighborhoods, :name, unique: true
  end
end
