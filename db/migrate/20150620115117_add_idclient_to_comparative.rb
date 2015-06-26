class AddIdclientToComparative < ActiveRecord::Migration
  def change
    add_column :comparatives, :client_id, :integer 
    add_foreign_key :comparatives, :clients
  end
end
