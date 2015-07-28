class CreateFundingInstruments < ActiveRecord::Migration
  def change
    create_table :funding_instruments do |t|
      t.string :token
      t.integer :user_id
      t.string :type
      t.string :name
      t.string :account_type
      t.string :description
      t.string :number
      t.string :expiration_month
      t.string :expiration_year
      t.string :stripe_id

      t.timestamps null: false
    end
  end
end
