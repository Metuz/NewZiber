class AddIndexToSerial < ActiveRecord::Migration
  def change
    add_index :reports, :serial, unique: true
  end
end
