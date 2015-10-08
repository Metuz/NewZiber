class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @costs = Cost.all
    respond_with(@costs)
  end

  def show
    respond_with(@cost)
  end

  def new
    @report = Report.find(params[:report_id])
    @cost = Cost.new
    respond_with(@cost)
  end

  def edit
  end

  def create
    @report = Report.find(params[:report_id])
    @cost = @report.costs.new(cost_params)
    respond_to do |format|
      if @cost.save
        format.html { redirect_to report_path(@cost.report_id) }
        format.json { render :show, status: :created, location: @cost }
        format.js
      else
        format.html { render :new }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cost.update(cost_params)
    respond_with(@cost)
  end

  def destroy
    @cost.destroy
    respond_with(@cost)
  end

  private
    def set_cost
      @cost = Cost.find(params[:id])
    end

    def cost_params
      params.require(:cost).permit(:name, :quantity, :price, :total, :report_id)
    end
end
