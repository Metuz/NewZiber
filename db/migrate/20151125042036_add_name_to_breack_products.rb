class AddNameToBreackProducts < ActiveRecord::Migration
  def change
    add_column :inspections, :name, :integer
  end
end
