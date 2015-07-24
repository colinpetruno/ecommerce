class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.string :name, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.references :product, null: false

      t.timestamps null: false
    end
  end
end
