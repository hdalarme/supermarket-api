class Api::V1::ItemsController < Api::V1::ApiController

    before_action :set_item, only: [:show, :update, :destroy]
    before_action :require_authorization!, only: [:show, :update, :destroy]
      
    # GET /api/v1/items
    def index
      @items = current_user.items
      render json: @items
    end
    
    # GET /api/v1/items/1
    def show
      render json: @item
    end
    
    # POST /api/v1/items
    def create
      @item = Item.new(item_params.merge(user: current_user))
      if @item.save
        render json: @item, status: :created
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
    
    # PATCH/PUT /api/v1/items/1
    def update
      if @item.update(item_params)
        render json: @item, status: :ok
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
    
    # DELETE /api/v1/items/1
    def destroy
      @item.destroy
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_item
        @item = Item.find(params[:id])
      end
    
      # Only allow a trusted parameter "white item" through.
      def item_params
        params.require(:item).permit(:list_id, :product_id, :quantidade)
      end
    
      def require_authorization!
        unless current_user == @item.user
          render json: {}, status: :forbidden
        end
      end

end
