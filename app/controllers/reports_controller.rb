class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  load_and_authorize_resource

  respond_to :html
  require 'spreadsheet'

  def index
      if current_user.is_a?(Secretary)
        @reports = Report.where(location_id: current_user.location_id)
      elsif current_user.is_a?(Technician)
        @reports = Report.where(technician_id: current_user.id)
      elsif current_user.is_a?(Admin)
        @report = Report.ransack(params[:q])
        @reports = @report.result(distinct: true)
        respond_to do |format|
          format.html
          format.xls {
              report = Spreadsheet::Workbook.new
              list = report.create_worksheet :name => "Reporte"
              list.row(0).concat %w{Clave Marca Modelo NoSerie LugarCompra FechaCompra UltimaRevision CostoOperacion CostoEnvio }
              @reports.each_with_index { |report, i|
                 list.row(i+1).push report.pin, report.brand.name, report.model, report.serial, report.store, report.bought_at, report.inspections.last.comment, report.costs.sum(:total), report.shipping_costs.sum(:total)
              }
              header_format = Spreadsheet::Format.new :color => :green, :weight => :bold
              list.row(0).default_format = header_format
              #output to blob object
              blob = StringIO.new()
              report.write blob
              #respond with blob object as a file
              send_data blob.string, :type => :xls
            }
        end
      elsif current_user.is_a?(Manager)
        @reports = Report.where(location_id: current_user.location_id)
      else
        @reports = Report.where(client_id: current_user.id)
      end
  end

  def show
    @inspection = Inspection.new
    @cost = Cost.new
    @shipping_cost = ShippingCost.new
    if current_user.is_a?(Client)
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
    session[:report_params] ||= {}
    @report = current_user.reports.new(session[:report_params])
    @report.current_step = session[:report_step]
  end

  def edit
  end

  def create
    session[:report_params].deep_merge!(report_params) if report_params
    @report = current_user.reports.new(session[:report_params])
    @report.current_step = session[:report_step]
    if @report.valid?
      if params[:back_button]
        @report.previous_step
      elsif @report.last_step?
        @report.save if @report.all_valid?
      else
        @report.next_step
      end
      session[:report_step] = @report.current_step
    end
    if @report.new_record?
      render 'new'
    else
      session[:report_step] = session[:report_params] = nil
      redirect_to @report
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
      params.require(:report).permit(:pin, :client_id, :technician_id, :ticket, :location_id, :serial, :delivered_at, :delivered, :receptionist, :finish, :model, :store, :bought_at, :brand_id, :comment, :cooler_pin, :policy)
    end

    def set_user
      if user_signed_in?
        authenticate_user!
      else
        authenticate_client!
      end
    end

    def render_report(reporte)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'LABEL1.tlf')
      report.start_new_page
      report.page.item(:var1).value(reporte.location.name)
      report.page.item(:var8).value(reporte.location.address)
      report.page.item(:var2).value(reporte.client.name)
      report.page.item(:var3).value(reporte.client.address)
      report.page.item(:var4).value(reporte.client.phone)
      report.page.item(:var5).value(reporte.client.email)
      report.page.item(:var6).value(reporte.serial)
      report.page.item(:var7).value(reporte.pin)
      report.page.item(:varimg).src(reporte.brand.logo.path)
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
