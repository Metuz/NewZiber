class UsersController < ApplicationController

  def index
    if current_user.is_a?(Admin)
      @users = User.where.not(type: Client).where.not(id: current_user.id)
    elsif current_user.is_a?(Manager)
      @users = User.where.not(type: Client).where(location_id: current_user.location_id).where.not(id: current_user.id)
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
