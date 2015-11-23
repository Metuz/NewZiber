class ManagersController < ApplicationController
  def edit
    @manager = User.find(params[:id])
  end

  def update
    @manager = User.find(params[:id])
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to user_path(@manager), notice: "Perfil Actualizado"}
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @manager = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private
    def manager_params
      params.require(:manager).permit(:name, :email, :location_id, :password, :password_confirmation)
    end
end
