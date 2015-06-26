class AddIdcomparativeIdproductToComparativeProduct < ActiveRecord::Migration
  def change
    add_column :comparative_products, :comparative_id, :integer 
    add_foreign_key :comparative_products, :comparatives
    add_column :comparative_products, :product_id, :integer 
    add_foreign_key :comparative_products, :products
  end
end
