class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.integer :location_id

      t.timestamps
    end
  end
end
