class Report < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :location
  has_many :inspections
  has_many :costs
  belongs_to :brand

  before_create :set_pin
  before_save :set_deliver_time
  before_save :set_finish
  before_save :set_total

  def set_total
    self.total = self.costs.sum(:total)
  end

  def set_pin
    self.pin = "R#{Report.count+1}"
  end

  def fninished
    if self.delivered?
      if self.finish?
        "Terminado"
      else
        "En Revision"
      end
    else
      "Sin recibir"
    end
  end

  def set_finish
    self.inspections.each do |inspection|
      if inspection.finish?
        report.finish = true
      end
    end
  end

  def set_deliver_time
    if self.delivered? && self.delivered_at == nil
      self.delivered_at = DateTime.now
      #self.receptionist = current_user.username
    end
  end

  def has_inspections?
    if self.inspections.count < 3
      if self.inspections.count == 0
        true
      elsif self.inspections.count > 0
        if self.inspections.last.finish?
          false
        else
          true
        end
      end
    else
      false
    end
  end

  def user_id_present?
    if self.user_id == nil
      false
    else
      true
    end
  end

  def is_assing?
    if self.user_id == nil
      "Sin Asignar"
    else
      self.user.username
    end
  end

  def is_delivered?
    if self.delivered?
      "Recibido"
    else
      "En Espera"
    end
  end

end
