class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_description
      t.string :asset_type
      t.string :status
      t.string :serial_no
      t.integer :user_id
      t.decimal :cost
      t.string :comment
      t.date :date_purchased

      t.timestamps
    end
    add_index :assets, [:user_id, :created_at]
  end
end
