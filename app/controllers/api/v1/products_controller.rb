class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: 201
    else
      render error: @product.errors, status: 422
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :unique_code, :price)
  end
end
