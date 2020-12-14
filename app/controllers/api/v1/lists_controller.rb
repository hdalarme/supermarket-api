class Api::V1::ListsController < Api::V1::ApiController
  
  before_action :set_list, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]
  #skip_before_action :verify_authenticity_token

  # GET /api/v1/lists
  def index
    @lists = current_user.lists
    #@lists = List.all
    render json: @lists
  end
  
  # GET /api/v1/lists/1
  def show
    render json: @list
  end
  
  # POST /api/v1/lists
  def create
    @list = List.new(list_params.merge(user: current_user))
    #@product = List.new(list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/lists/1
  def update
    if @list.update(list_params)
      render json: @list, status: :ok
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/lists/1
  def destroy
    @list.destroy
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:name)
    end
  
    def require_authorization!
      unless current_user == @list.user
        render json: {}, status: :forbidden
      end
    end

end
