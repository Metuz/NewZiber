class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  load_and_authorize_resource

  respond_to :html

  def index
    if user_signed_in?
      if current_user.receptionist?
        @reports = Report.where(location_id: current_user.location_id)
      elsif current_user.technician?
        @reports = Report.where(user_id: current_user.id)
      elsif current_user.admin?
        @reports = Report.all
      else
        @reports = Report.where(location_id: current_user.location_id)
      end
    else
      @reports = Report.where(client_id: current_client.id)
    end
    respond_with(@reports)
  end

  def show
    @inspection = Inspection.new
    @cost = Cost.new
    respond_with(@report)
  end

  def new
    @report = current_client.reports.new
  end

  def edit
  end

  def create
    @report = current_client.reports.new(report_params)
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Reporte Enviado' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @report.update(report_params)
    respond_with(@report)
  end

  def destroy
    @report.destroy
    respond_with(@report)
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:pin, :client_id, :user_id, :ticket, :location_id, :name, :serial, :number, :delivered_at, :delivered, :receptionist, :finish)
    end

    def set_user
      if user_signed_in?
        authenticate_user!
      else
        authenticate_client!
      end
    end

    def create_inspections(report)
      3.times do |number|
        report.inspections.create(title: "Inspeccion #{number+1}", report_id: report.id)
      end
    end

end
