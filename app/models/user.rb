class User < ActiveRecord::Base
  belongs_to :location
  has_many :reports
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  scope :set_technician, ->{ where(technician: true) }
  scope :set_location, -> (user){ where(location_id: user.location_id) }

  def charge
    if self.manager
      "Gerente"
    elsif self.technician
      "Tecnico"
    else
      "Recepcionista"
    end
  end

end
