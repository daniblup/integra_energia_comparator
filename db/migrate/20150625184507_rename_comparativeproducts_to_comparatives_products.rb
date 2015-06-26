class RenameComparativeproductsToComparativesProducts < ActiveRecord::Migration
  def change
    rename_table :comparative_products, :comparatives_products
  end
end
