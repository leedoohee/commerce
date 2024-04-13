class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    # before_action :authenticate_user, only: ['sessions#respond_to_on_destroy']

    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[name avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
    end
    # def authenticate_check
    #     if request.headers['authorization']
    #         begin
    #             jwt_payload = JWT.decode(request.headers['authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key).first
    #             Rails.logger.info("object: #{headers['authorization'].split(' ').last}")
    #         rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
    #             Rails.logger.info("object: #{headers['authorization'].split(' ')[1].remove('"')}")
    #         end
    #     end

    #     @current_user = User.find(jwt_payload)
    
    #     if !@current_user
    #         render json: {
    #             status: { code: 401, message: "Couldn't find an active session." }
    #         }
    #     end
    # end
end
