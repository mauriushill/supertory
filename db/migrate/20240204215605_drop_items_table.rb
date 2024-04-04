class DropItemsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :items if ActiveRecord::Base.connection.table_exists? :items
    drop_table :comments if ActiveRecord::Base.connection.table_exists? :comments
  end
end
