class UsersController < ApplicationController
  def index
    if current_user.is_a?(Admin)
      @users = User.where.not(type: Client)
    elsif current_user.is_a?(Manager)
      @users = User.where.not(type: Client).where(location_id: current_user.id ) 
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
