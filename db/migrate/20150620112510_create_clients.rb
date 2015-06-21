class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :email
      t.string :postal_code
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
