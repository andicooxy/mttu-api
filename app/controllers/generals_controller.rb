class GeneralsController < ApplicationController
    
    def login  
        user = is_user(params[:email],params[:password],true)
        if user == false 
          render json: :'Unauthorized', status: 401 
        else 
          render json: user.cerialize_for_login
        end
    end


    include CsvGenerator
    def reports
        if !params[:from].present? && !params[:to].present?
            params[:from] = Time.zone.now.beginning_of_month
            params[:to] = Time.zone.now.end_of_month
        else
            params[:from] = params[:from].beginning_of_day
            params[:to] = params[:to].end_of_day
        end
      fields =  Offense.attribute_names - ["id","user_id"] + ["Create By"]
      records = Offense.created_between(params[:from],params[:to])
      send("generate_csv",records,fields, params[:from].strftime("%D"),params[:to].strftime("%D"))
    end

end
