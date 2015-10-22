class Location < ActiveRecord::Base
  has_many :users
  has_many :products
  has_many :reports


  def manager
    self.users.first.username
  end
end
