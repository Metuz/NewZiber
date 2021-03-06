class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def index
    if current_user.is_a?(Admin)
      @products = Product.all
    elsif current_user.is_a?(Manager)
      @products = Product.where(location_id: current_user.location_id)
    end
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end
  def add_quantity
   @product = Product.find(params[:id])
   @product.quantity += params[:product][:sum].to_i
   @product.sum = nil
   @product.save
   respond_to do |format|
     format.js
     format.json { render json: @product.to_json(only: :quantity)}
   end
 end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :category_id, :brand_id, :location_id, :quantity, :sum)
    end
end
