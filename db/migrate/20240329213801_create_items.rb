class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.boolean :status, default: false
      t.references :facility, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
