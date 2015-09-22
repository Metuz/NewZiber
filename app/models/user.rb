class User < ActiveRecord::Base
  belongs_to :location
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




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
