class CreateShippingCosts < ActiveRecord::Migration
  def change
    create_table :shipping_costs do |t|
      t.string :serial
      t.string :company
      t.integer :report_id
      t.datetime :date
      t.decimal :total
      t.boolean :shipping_by_company
      t.boolean :shipping_by_client

      t.timestamps
    end
  end
end
