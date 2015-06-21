class CreateComparativeProducts < ActiveRecord::Migration
  def change
    create_table :comparative_products do |t|
      t.integer :amount
      t.integer :hours_use

      t.timestamps null: false
    end
  end
end
