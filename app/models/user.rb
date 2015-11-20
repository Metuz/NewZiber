class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def charge
    if self.is_a?(Manager)
      "Gerente"
    elsif self.is_a?(Secretary)
      "Recepcionista"
    else
      "Tecnico"
    end
  end

end
