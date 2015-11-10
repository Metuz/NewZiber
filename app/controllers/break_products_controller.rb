class BreakProductsController < ApplicationController
  before_action :set_break_product, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @break_products = BreakProduct.all
    respond_with(@break_products)
  end

  def show
    respond_with(@break_product)
  end

  def new
    @break_product = BreakProduct.new
    respond_with(@break_product)
  end

  def edit
  end

  def create
    @break_product = BreakProduct.new(break_product_params)
    @break_product.save
    respond_with(@break_product)
  end

  def update
    @break_product.update(break_product_params)
    respond_with(@break_product)
  end

  def destroy
    @break_product.destroy
    respond_with(@break_product)
  end

  private
    def set_break_product
      @break_product = BreakProduct.find(params[:id])
    end

    def break_product_params
      params.require(:break_product).permit(:model, :serial, :brand_id, :report_id)
    end
end
