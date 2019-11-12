class UserLoginController < ApplicationController
    
    def login  
        user = is_user(params[:email],params[:password],true)
        if user == false 
          render json: :'Unauthorized', status: 401 
        else 
          render json: user.cerialize_for_login
        end
    end
end
