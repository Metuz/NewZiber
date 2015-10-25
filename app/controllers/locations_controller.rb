class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  respond_to :html

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    respond_to do |format|
      format.html # don't forget if you pass html
      #format.xls { send_data(@posts.to_xls) }
       format.xls {
         filename = "Posts-#{Time.now.strftime("%Y%m%d%H%M%S")}.xls"
         send_data(@location.reports.all.to_xls, :type => "text/xls; charset=utf-8; header=present", :filename => filename)
       }
    end
  end

  def new
    @location = Location.new
    respond_with(@location)
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    @location.save
    respond_with(@location)
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address, :phone)
    end
end
