class ChangeFieldTypes < ActiveRecord::Migration
  def up
    change_table :comparatives do |t|
      t.change :current_cost, :float
      t.change :integra_cost, :float
      t.change :installation_cost, :float
    end
    
    change_table :comparatives_products do |t|
      t.change :hours_use, :float
    end
  end

  def down
    change_table :comparatives do |t|
      t.change :current_cost, :integer
      t.change :integra_cost, :integer
      t.change :installation_cost, :integer
    end
    
    change_table :comparatives_products do |t|
      t.change :hours_use, :integer
    end
  end
end
