class Location < ActiveRecord::Base
  has_many :managers
  has_many :secretaries
  has_many :technicians
  has_many :products
  has_many :reports
  has_many :break_products

  def manager
    if self.managers.count == 0
      "Sin Managers"
    else
      self.managers.first.name
    end
  end



end
