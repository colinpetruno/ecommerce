class AddFundingInstrumentIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :funding_instrument_id, :integer
  end
end
