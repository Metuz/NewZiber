class Report < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  belongs_to :location
  has_many :inspections
  has_many :costs
  belongs_to :brand
  has_one :break_product

  before_create :set_pin
  before_save :set_deliver_time
  before_save :set_finish
  before_save :set_total

  validates :store, presence: true
  validates :bought_at, presence: true
  validates :serial, presence: true, uniqueness: true
  validates :comment, presence: true, length:  { maximum: 1000 }
  VALID_COOLERPIN_REGEX = /\A[CUSMX+\d]+\z/
  validates :cooler_pin, format: { with: VALID_COOLERPIN_REGEX }, length:  { maximum: 12 }, :allow_blank => true


  scope :in_last_month, -> { where("created_at > ?", 1.month.ago) }

  def set_total
    self.total = self.costs.sum(:total)
  end

  def set_pin
    if Report.last.present?
      number = Report.in_last_month.count + 1
      number_to_string = ""
      if number < 10
        number_to_string = "000#{number}"
      elsif number < 100
        number_to_string = "00#{number}"
      elsif number < 1000
        number_to_string = "0#{number}"
      else
        number_to_string = "#{number}"
      end
      last = Report.last.created_at.month
      last_year = Report.last.created_at.year
      if last_year == self.created_at.year && last == self.created_at.month
        self.pin = "NZI-#{self.location.pin}-#{self.brand.pin}-#{last_year}#{last}-#{number_to_string}"
      else
        number_to_string = "0001"
        self.pin = "NZI-#{self.location.pin}-#{self.brand.pin}-#{self.created_at.year}#{self.created_at.month}-#{number_to_string}"
      end
    else
      number_to_string = "0001"
      self.pin = "NZI-#{self.location.pin}-#{self.brand.pin}-#{self.created_at.year}#{self.created_at.month}-#{number_to_string}"
    end
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

  def name
    if self.user_id.present?
      self.user.username
    else
      "Sin Asignar"
    end
  end


end
