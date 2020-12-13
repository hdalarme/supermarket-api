class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  #before_action :require_authorization!, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/products
  def index
    #@products = current_user.products
    @products = Product.all
    render json: @products
  end
  
  # GET /api/v1/products/1
  def show
    render json: @product
  end
  
  # POST /api/v1/products
  def create
    #@product = Product.new(product_params.merge(user: current_user))
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :unidadeMedida)
    end
  
    #def require_authorization!
      #unless current_user == @product.user
        #render json: {}, status: :forbidden
      #end
    #end
end
