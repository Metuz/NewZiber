class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :title
      t.string :comment
      t.boolean :finish
      t.string :serial
      t.integer :report_id

      t.timestamps
    end
  end
end
