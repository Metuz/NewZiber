class CreateBreakProducts < ActiveRecord::Migration
  def change
    create_table :break_products do |t|
      t.string :model
      t.string :serial
      t.integer :brand_id
      t.integer :report_id
      t.integer :location_id

      t.timestamps
    end
  end
end
