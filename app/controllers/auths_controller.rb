class AuthsController < ApplicationController
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :http_basic_authenticate

    def http_basic_authenticate
        authenticate_or_request_with_http_basic do |username, password|
          is_user(username,password)     
        end
    end
end
