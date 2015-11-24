class ShippingCost < ActiveRecord::Base
  belongs_to :report

  before_save :set_total

  def set_total
    if self.shipping_by_client.present?
      self.total = 0
    end
  end


end
