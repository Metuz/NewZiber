class Client < User
  has_many :reports
  validates :address, presence: true
  validates :phone, presence: true
end
