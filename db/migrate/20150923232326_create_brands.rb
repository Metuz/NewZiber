class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :pin
      t.text :policy

      t.timestamps
    end
  end
end
