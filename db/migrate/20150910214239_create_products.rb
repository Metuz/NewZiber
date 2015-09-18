class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.integer :brand_id
      t.integer :quantity
      t.integer :location_id

      t.timestamps
    end
  end
end
