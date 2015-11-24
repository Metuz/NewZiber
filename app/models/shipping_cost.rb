class ShippingCost < ActiveRecord::Base
  belongs_to :report

  before_save :set_total

  def set_total
    if self.client.present?
      self.total = 0
    end
    self.date = DateTime.now
  end


end
