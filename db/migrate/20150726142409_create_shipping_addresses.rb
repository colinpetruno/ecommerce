class CreateShippingAddresses < ActiveRecord::Migration
  def change
    create_table :shipping_addresses do |t|
      t.references :order
      t.string :address_1, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :first_name, null: false
      t.string :last_name
      t.string :state, null: false
      t.string :zip, null: false

      t.timestamps null: false
    end
  end
end
