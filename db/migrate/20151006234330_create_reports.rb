class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :pin
      t.integer :client_id
      t.integer :technician_id
      t.integer :location_id
      t.string :model
      t.string :store
      t.datetime :bought_at
      t.string :serial
      t.integer :brand_id


      t.timestamps
    end
  end
end
