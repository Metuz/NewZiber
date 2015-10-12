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
    if client_signed_in?
      respond_to do |format|
        format.html
        format.pdf { render_report(@report) }
      end
    else
      respond_to do |format|
        format.html
        format.pdf { render_report_list(@report) }
     end
   end
    #respond_with(@report)
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

    def render_report(reporte)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'Ziber.tlf')
      report.start_new_page
      report.page.item(:var1).value(reporte.location.name)
      report.page.item(:var2).value(reporte.client.clientname)
      report.page.item(:var3).value(reporte.client.address)
      report.page.item(:var4).value(reporte.client.phone)
      report.page.item(:var5).value(reporte.client.email)
      report.page.item(:var6).value(reporte.created_at.strftime('%x %R'))
      report.page.item(:var7).value(reporte.number)
      report.page.item(:var8).value(reporte.pin)
      send_data report.generate, filename: 'reporte.pdf',
                                  type: 'application/pdf',
                                 disposition: 'attachment'
    end

    def render_report_list(reporte)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'Soporte.tlf')
      report.start_new_page
      report.page.item(:var1).value(reporte.pin)
      report.page.item(:var2).value(reporte.name)
      report.page.item(:var3).value(reporte.serial)
      report.page.item(:var4).value(reporte.number)
      reporte.inspections.each do |inspection|
        report.list(:tabla1).add_row do |row|
          row.values var5: inspection.title,
                     var6: inspection.comment
        end
      end
      reporte.costs.each do |cost|
        report.list(:tabla2).add_row do |row|
          row.values var7: cost.name,
                     var8: cost.quantity,
                     var9: "$#{sprintf "%.2f", cost.price}",
                     var10: "$#{sprintf "%.2f", cost.total}"
        end
      end
      send_data report.generate, filename: 'reporte-admin.pdf',
                                 type: 'application/pdf',
                                 disposition: 'attachment'
    end

end
