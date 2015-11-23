class TechniciansController < ApplicationController
  def edit
    @technician = User.find(params[:id])
  end

  def update
    @technician = User.find(params[:id])
    respond_to do |format|
      if @technician.update(technician_params)
        format.html { redirect_to user_path(@technician), notice: "Perfil Actualizado"}
        format.json { render :show, status: :created, location: @technician }
      else
        format.html { render :edit }
        format.json { render json: @technician.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @technician = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private
    def technician_params
      params.require(:technician).permit(:name, :email, :location_id, :password, :password_confirmation)
    end
end
