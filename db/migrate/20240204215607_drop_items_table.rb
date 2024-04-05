class DropItemsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :comments if ActiveRecord::Base.connection.table_exists? :comments
    drop_table :items if ActiveRecord::Base.connection.table_exists? :items
    drop_table :purchases if ActiveRecord::Base.connection.table_exists? :purchases
    drop_table :facilities if ActiveRecord::Base.connection.table_exists? :facilities
    drop_table :products if ActiveRecord::Base.connection.table_exists? :products
    drop_table :folders if ActiveRecord::Base.connection.table_exists? :folders

  end
end
