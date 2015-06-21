class CreateComparatives < ActiveRecord::Migration
  def change
    create_table :comparatives do |t|
      t.integer :current_cost
      t.integer :integra_cost
      t.integer :installation_cost
      t.float :amortization_term

      t.timestamps null: false
    end
  end
end
