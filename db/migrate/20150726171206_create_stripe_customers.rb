class CreateStripeCustomers < ActiveRecord::Migration
  def change
    create_table :stripe_customers do |t|
      t.string :email, null: false
      t.string :stripe_id, null:false

      t.timestamps null: false
    end

    add_index :stripe_customers, :email
  end
end
