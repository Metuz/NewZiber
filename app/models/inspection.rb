class Inspection < ActiveRecord::Base
  belongs_to :report


  before_create :set_title
  before_save :set_finish

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
  
end
