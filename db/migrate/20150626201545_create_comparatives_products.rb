class CreateComparativesProducts < ActiveRecord::Migration
  def change
    drop_table :comparatives_products
    create_table :comparatives_products do |t|
      t.integer :comparative_id
      t.integer :product_id
      t.integer :amount
      t.integer :hours_use

      t.timestamps null: false
    end
  end
end
