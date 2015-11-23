class SecretariesController < ApplicationController
  def edit
    @secretary = User.find(params[:id])
  end

  def update
    @secretary = User.find(params[:id])
    respond_to do |format|
      if @secretary.update(secretary_params)
        format.html { redirect_to user_path(@secretary), notice: "Perfil Actualizado"}
        format.json { render :show, status: :created, location: @secretary }
      else
        format.html { render :edit }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @secretary = User.find(params[:id]).destroy
    redirect_to users_path
  end

  private
    def secretary_params
      params.require(:secretary).permit(:name, :email, :location_id, :password, :password_confirmation)
    end
end
