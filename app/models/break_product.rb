class BreakProduct < ActiveRecord::Base
  belongs_to :report
  belongs_to :location
  belongs_to :brand

end
