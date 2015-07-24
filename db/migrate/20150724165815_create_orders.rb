class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :session_id, null: false
      t.integer :user_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
