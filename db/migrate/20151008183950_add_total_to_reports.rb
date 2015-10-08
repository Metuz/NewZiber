class AddTotalToReports < ActiveRecord::Migration
  def change
    add_column :reports, :total, :decimal
  end
end
