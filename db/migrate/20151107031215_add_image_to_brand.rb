class AddImageToBrand < ActiveRecord::Migration
  def up
   add_attachment :brands, :logo
  end

   def down
     remove_attachment :brands, :logo
   end
end
