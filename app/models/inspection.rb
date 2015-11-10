class Inspection < ActiveRecord::Base
  belongs_to :report


  before_create :set_title
  before_save :new_break_product, :set_finish

  def set_title
    report = self.report
    self.title = "Revision #{self.report.inspections.count + 1}"
  end

  def set_finish
    if self.finish?
      a = Report.find_by(id: self.report_id)
      a.finish = true
      a.save
    end
  end

  def new_break_product
    if self.serial.present? && self.finish?
      break_product = BreakProduct.create(serial: self.report.serial, model: self.report.model, brand_id: self.report.brand_id, report_id: self.report_id, location_id: self.report.location_id)
    end
  end

end
