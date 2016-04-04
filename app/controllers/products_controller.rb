class ProductsController < ApplicationController
  before_action :authenticate_permissions!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
      flash[:success] = "Successfully Created Product"
    else
      render :new
      flash.now[:error] = "Please fill in all the fields"
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to products_path
      flash[:success] = "Successfully Updated Product"
    else
      render :edit
      flash.now[:error] = "Please fill in all the fields"
    end
  end

  private

  def product_params
    params
      .require(:product)
      .permit(:name, :price, :publish, :short_description, :description)
  end
end
