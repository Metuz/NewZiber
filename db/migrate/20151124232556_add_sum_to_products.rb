class AddSumToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sum, :integer
  end
end
