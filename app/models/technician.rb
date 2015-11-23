class Technician < User
  has_many :reports
  belongs_to :location
  validates :location_id, presence: true

   scope :location, ->(location){where(location_id: location)}
end
