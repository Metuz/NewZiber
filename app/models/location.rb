class Location < ActiveRecord::Base
  has_many :users
  has_many :products
  has_many :reports
  has_many :break_products



  def manager
    self.users.first.username
  end



end
