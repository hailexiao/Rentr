class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :month, null: false
      t.integer :amount, null: false
      t.belongs_to :rental_unit

      t.timestamps null: false
    end
  end
end
