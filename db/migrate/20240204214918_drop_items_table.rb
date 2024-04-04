class DropItemsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :items if ActiveRecord::Base.connection.table_exists? :items
  end
end
