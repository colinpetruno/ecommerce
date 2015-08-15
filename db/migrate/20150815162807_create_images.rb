class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product
      t.string :resource

      t.timestamps null: false
    end
  end
end
