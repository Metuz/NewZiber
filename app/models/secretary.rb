class Secretary < User
  belongs_to :location
  validates :location_id, presence: true
end
