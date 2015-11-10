class InspectionsController < ApplicationController
  before_action :set_inspection, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

  respond_to :html

  def index
    @inspections = Inspection.all
    respond_with(@inspections)
  end

  def show
    respond_with(@inspection)
  end

  def new
    @report = Report.find(params[:report_id])
    @inspection = Inspections.new
    respond_with(@inspection)
  end

  def edit
  end

  def create
    @report = Report.find(params[:report_id])
    @inspection = @report.inspections.new(inspection_params)
    respond_to do |format|
      if @inspection.save
        format.html { redirect_to report_path(@inspection.report_id), notice: 'Reporte Enviado' }
        format.json { render :show, status: :created, location: @inspection }
        format.js
      else
        format.html { render :new }
        format.json { render json: @inspection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @inspection.update(inspection_params)
    respond_with(@inspection)
  end

  def destroy
    @inspection.destroy
    respond_with(@inspection)
  end

  private
    def set_inspection
      @inspection = Inspection.find(params[:id])
    end

    def inspection_params
      params.require(:inspection).permit(:title, :comment, :finish, :serial, :report_id)
    end
end
