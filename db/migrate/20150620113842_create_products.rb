class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :consumption_w
      t.string :name_equiv
      t.integer :consumption_w_equiv
      t.float :price_equiv

      t.timestamps null: false
    end
  end
end
