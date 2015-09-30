class UserController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
    def index
      @users = User.where.not(id: current_user.id)
    end

    def show
      @user = User.find_by_id(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to users_admin_path(@user), notice: 'Employee was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_admin_index_path, notice: "User succesfully created!"
        else
            render :new
        end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_admin_index_path
    end
    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :location_id, :admin, :manager, :technician, :receptionist)
    end
end
