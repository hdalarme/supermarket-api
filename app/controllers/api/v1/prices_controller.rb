class Api::V1::PricesController < Api::V1::ApiController

    before_action :set_price, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
  #skip_before_action :verify_authenticity_token

  # GET /api/v1/prices
  def index
    #@prices = current_user.prices
    #@lists = List.all
    @prices = Price.all
    render json: @prices
  end
  
  # GET /api/v1/prices/1
  def show
    render json: @price
  end
  
  # POST /api/v1/prices
  def create
    @price = Price.new(price_params.merge(user: current_user))
    #@price = Price.new(price_params)
    if @price.save
      render json: @price, status: :created
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/prices/1
  def update
    if @price.update(price_params)
      render json: @price, status: :ok
    else
      render json: @price.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/prices/1
  def destroy
    @price.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price
      @price = Price.find(params[:id])
    end
  
    # Only allow a trusted parameter "white price" through.
    def price_params
      params.require(:price).permit(:product_id, :supermarket_id, :valor, :valorPromocional)
    end
  
    def require_authorization!
      unless current_user == @price.user
        render json: {}, status: :forbidden
      end
    end

end
