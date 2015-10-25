class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :user
      t.string :name, null: false
      t.string :code, null: false
      t.boolean :redeemed, default: false, null: false
      t.integer :inventory
      t.integer :inventory_remaining
      t.datetime :begins
      t.datetime :expires

      t.timestamps null: false
    end

    create_table :discounts do |t|
      t.references :coupon, index: true
      t.references :order, index: true

      t.timestamps null: false
    end

    add_index :coupons, :code, unique: true
  end
end
