class ChangeStatusToIntegerInItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :status, :boolean
    add_column :items, :status, :integer, default: 0
  end
end
