class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :sku, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps null: false
    end
  end
end
