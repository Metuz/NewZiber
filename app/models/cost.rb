class Cost < ActiveRecord::Base
  belongs_to :report

  before_save :set_total, :set_total_report

  def set_total
    self.total = self.quantity * self.price
  end

  def set_total_report
    a = Report.find_by(id: self.report_id)
    a.total = a.costs.sum(:total)
    a.save
  end
end
