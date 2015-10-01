class ChangeImageToPolymorphic < ActiveRecord::Migration
  def up
    rename_column :images, :product_id, :imageable_id
    add_column :images, :imageable_type, :string

    ActiveRecord::Base.
      connection.
      execute("UPDATE images SET imageable_type = 'Product' where id > 0")

    change_column_null :images, :imageable_type, false
  end

  def down
    drop_column :images, :imageable_type
    rename_column :images, :imageable_id, :product_id
  end
end
