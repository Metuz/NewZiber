class Report < ActiveRecord::Base
  belongs_to :client
  belongs_to :technician
  belongs_to :location
  has_many :inspections
  has_many :costs
  belongs_to :brand
  has_one :break_product
  has_many :shipping_costs

  before_create :set_pin
  before_save :set_deliver_time
  before_save :set_finish
  before_save :set_total


  validates_presence_of :store, :if => lambda { |o| o.current_step == "product"}
  validates_presence_of :bought_at, :if => lambda { |o| o.current_step == "product"}
  validates_presence_of :serial, :if => lambda { |o| o.current_step == "product"}
  validates_presence_of :policy, :if => lambda { |o| o.current_step == "policy"}
  validates_presence_of :comment, :if => lambda { |o| o.current_step == "product"}
  validates :serial, uniqueness: true
  validates :comment, length:  { maximum: 1000 }

  VALID_COOLERPIN_REGEX = /\A[CUSMX+\d]+\z/
  validates :cooler_pin, format: { with: VALID_COOLERPIN_REGEX }, length:  { maximum: 12 }, :allow_blank => true


  scope :in_last_month, -> { where("created_at > ?", 1.month.ago) }
  scope :not_delivered, -> { where(delivered: false) }
  scope :delivered_in, -> { where(delivered: true) }
  scope :finished_in, -> { where(finish: true) }
  scope :not_finished, -> { where(finish: false) }

  attr_writer :current_step


  def current_step
    @current_step || steps.first
  end

  def steps
    %w[brand policy product]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

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

  def finished
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
    if self.delivered?
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

  def is_assing?
    if self.technician_id == nil
      "Sin Asignar"
    else
      self.technician.name
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
    if self.technician_id.present?
      self.technician.name
    else
      "Sin Asignar"
    end
  end

  def has_shipping_cost?
    if self.shipping_costs.count == 1
      false
    else
      true
    end
  end


end
