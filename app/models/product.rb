class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  belongs_to :location

  before_save :set_quantity

  def set_quantity
    if self.sum.present?
      self.quantity += self.sum
      self.sum = nil
    end
  end
end
