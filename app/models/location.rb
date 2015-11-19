class Location < ActiveRecord::Base
  has_many :managers
  has_many :secretaries
  has_many :technicias
  has_many :products
  has_many :reports
  has_many :break_products



  def manager
    self.users.first.username
  end



end
