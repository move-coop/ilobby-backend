class ApplicationController < ActionController::API
      # skip_before_action :verify_authenticity_token

      def encode_token(id)
          JWT.encode({user_id: id}, ENV["JWT_SALT"])
      end
  
      def get_auth_header
        request.headers["Authorization"]
      end
  
      def decoded_token
            begin
                  JWT.decode(get_auth_header, ENV["JWT_SALT"])[0]["user_id"]
            rescue
                  nil
            end
      end
  
      def session_user
            User.find_by(id: decoded_token)
      end
  
      def logged_in?
            !!session_user
      end


end
