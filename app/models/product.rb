class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  belongs_to :location

end
