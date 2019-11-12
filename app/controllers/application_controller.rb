class ApplicationController < ActionController::API
    def is_user(username,password,return_uesr=false)
        user = User.find_by(email: username)
        if user.present? 
            if user.authenticate(password)
                return user if return_uesr
                params[:user_id] = user.id 
                return true 
            end                
        end 
        false 
    end
end
