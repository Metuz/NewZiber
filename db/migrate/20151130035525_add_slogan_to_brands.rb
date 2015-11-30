class AddSloganToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :slogan, :string
  end
end
