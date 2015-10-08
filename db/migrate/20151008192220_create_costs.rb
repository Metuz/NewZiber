class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.decimal :total
      t.integer :report_id

      t.timestamps
    end
  end
end
