class Api::V1::SupermarketsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :set_supermarket, only: [:show, :update, :destroy]
  #before_action :require_authorization!, only: [:show, :update, :destroy]
  

  # GET /api/v1/supermarkets
  def index
    #@supermarkets = current_user.supermarkets
    @supermarkets = Supermarket.all
    render json: @supermarkets
  end
  
  # GET /api/v1/supermarkets/1
  def show
    render json: @supermarket
  end
  
  # POST /api/v1/supermarkets
  def create
    #@supermarket = Supermarket.new(supermarket_params.merge(user: current_user))
    @supermarket = Supermarket.new(supermarket_params)
    if @supermarket.save
      render json: @supermarket, status: :created
    else
      render json: @supermarket.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/supermarkets/1
  def update
    if @supermarket.update(supermarket_params)
      render json: @supermarket, status: :ok
    else
      render json: @supermarket.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/supermarkets/1
  def destroy
    @supermarket.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supermarket
      @supermarket = Supermarket.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def supermarket_params
      params.require(:supermarket).permit(:name, :phone, :address, :district, :city, :state)
    end
  
    #def require_authorization!
      #unless current_user == @supermarket.user
        #render json: {}, status: :forbidden
      #end
    #end

end
