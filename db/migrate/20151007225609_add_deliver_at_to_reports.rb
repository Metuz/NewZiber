class AddDeliverAtToReports < ActiveRecord::Migration
  def change
    add_column :reports, :delivered_at, :datetime
    add_column :reports, :delivered, :boolean, default: false
    add_column :reports, :receptionist, :string
    add_column :reports, :finish, :boolean, default: false
  end
end
