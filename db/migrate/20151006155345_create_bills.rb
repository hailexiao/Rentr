class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :month, null: false
      t.integer :amount, null: false
      t.integer :rental_unit_id

      t.timestamps null: false
    end
  end
end
