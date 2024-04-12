require 'jwt'

class AuthMiddleware
    def initialize app
      @app = app
    end
  
    def call(env)
      request = ActionDispatch::Request.new env
      status, headers, body = @app.call(env)

      Rails.logger.info("object: #{request.original_fullpath}")

      if !headers['authorization']
        if request.original_fullpath != '/login'
          Rails.logger.info("object: #{headers['authorization']}")
          
          begin
            jwt_payload = JWT.decode(headers['authorization'].split(' ').last, Rails.application.credentials.devise_jwt_secret_key).first
          rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            Rails.logger.info("object: #{headers['authorization'].split(' ')[1].remove('"')}")
          end

          @current_user = User.find(jwt_payload)

          if !@current_user
            render json: {
              status: { code: 401, message: "Couldn't find an active session." }
            }
          end
        end
      end

      [status, headers, body]

    end
end