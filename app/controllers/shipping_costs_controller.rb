class ShippingCostsController < ApplicationController
  before_action :set_shipping_cost, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @shipping_costs = ShippingCost.all
    respond_with(@shipping_costs)
  end

  def show
    respond_with(@shipping_cost)
  end

  def new
    @report = Report.find(params[:report_id])
    @shipping_cost = ShippingCost.new
    respond_with(@shipping_cost)
  end

  def edit
  end

  def create
      @report = Report.find(params[:report_id])
      @shipping_cost = @report.shipping_costs.new(shipping_cost_params)
      respond_to do |format|
        if @shipping_cost.save
          format.html { redirect_to report_path(@shipping_cost.report_id) }
          format.json { render :show, status: :created, location: @shipping_cost }
          format.js
        else
          format.html { render :new }
          format.json { render json: @shipping_cost.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    @shipping_cost.update(shipping_cost_params)
    respond_with(@shipping_cost)
  end

  def destroy
    @shipping_cost.destroy
    respond_with(@shipping_cost)
  end

  private
    def set_shipping_cost
      @shipping_cost = ShippingCost.find(params[:id])
    end

    def shipping_cost_params
      params.require(:shipping_cost).permit(:serial, :company, :report_id, :date, :total, :shipping_by_company, :shipping_by_client, :client)
    end
end
