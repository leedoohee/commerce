require 'jwt'

class AuthMiddleware
    def initialize app
      @app = app
    end
  
    def call(env)
      request = ActionDispatch::Request.new env
      status, headers, body = @app.call(env)

      Rails.logger.info("object: #{request.cookie_jar.signed[:token]}")
      if !request.cookie_jar.signed[:token]
        if request.original_fullpath != '/login' && request.original_fullpath != '/signup' && request.original_fullpath != '/login-v2'

          begin
            jwt_payload = JWT.decode(request.cookie_jar.signed[:token].split(' ').last, Rails.application.credentials.devise_jwt_secret_key).first
          rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            Rails.logger.info("object: #{request.cookie_jar.signed[:token].split(' ')[1].remove('"')}")
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