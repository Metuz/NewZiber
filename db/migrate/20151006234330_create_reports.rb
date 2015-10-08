class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :pin
      t.integer :client_id
      t.integer :user_id
      t.integer :location_id
      t.string :name
      t.string :serial
      t.string :number


      t.timestamps
    end
  end
end
