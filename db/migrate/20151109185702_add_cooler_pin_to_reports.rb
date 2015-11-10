class AddCoolerPinToReports < ActiveRecord::Migration
  def change
    add_column :reports, :cooler_pin, :string
  end
end
