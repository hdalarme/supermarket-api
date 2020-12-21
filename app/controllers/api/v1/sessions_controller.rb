class Api::V1::SessionsController < Devise::SessionsController
    #skip_before_action :verify_authenticity_token, :only => :create
    before_action :ex_sign_in
    before_action :sign_in_params#, only: :create
    before_action :load_user, only: :create
    
    
    # sign in
    def create
        if @user.valid_password?(sign_in_params[:password])
            sign_in "user", @user
            render json: {
                messages: "Signed In Successfully",
                is_success: true,
                data: {user: @user}
            }, status: :ok
        else
            render json: {
                messages: "Sign In Failed - Unauthorized",
                is_success: false,
                data: {}
            }, status: :Unauthorized
        end
    end
    
    private
    def ex_sign_in
        if params[:user].present?
            render json: {
                messages: "ok",
                data: {user: sign_in_params[:email]}
            }
        else
            render json: {
                messages: "error"
            }
        end
    end

    def sign_in_params
        #params.require(:sign_in).permit(:email, :password)
        params.require(:sign_in).permit(:email, :password)
        #params.permit(:email, :password)
    end

    def load_user
        @user = User.find_for_database_authentication(email: sign_in_params[:email])
        #@user = User.find_by_email(sign_in_params[:email])
        if @user
            return @user
        else
            render json: {
                messages: "Cannot get User",
                is_success: false,
                data: {}
            }, status: :failure
        end
    end

end