class OffendersController < AuthsController
  def create
    begin
      offender = Offender.new(data_params)
      offender.user_id = params[:user_id]
      offender.save!
      render json:  offender.cerialize
    rescue => exception
      render json: exception, status: :unprocessable_entity
    end
  end
  
  def show
    offender = existing_offender
    if offender
      existing_offender.update!(data_params)
      render json: offender.cerialize
    else
      render json: :'resource not found', status:  404
    end
  end

  def index 
    offenders = Offender.order('created_at ASC') 
                     .paginate(per_page: params[:limit] || 30 , page: params[:page] || 1)                                                        
    render json: summary(offenders)
  end
  
  def update
    offender = existing_offender
    if offender
      existing_offender.update!(data_params)
      render json: offender.cerialize
    else
      render json: :'resource not found', status:  404
    end
  end
  
  def destroy
    offender = existing_offender
    if offender
      existing_offender.destroy!
      head :no_content
    else
      render json: :'resource not found', status:  404
    end
  end
  
  protected
    def summary(data)           
        {current_page:  data.current_page,
         current_page_total:  data.length,
         total_pages:  data.total_pages,
         total_filtered:  data.total_entries,
         offenders: data.map{|k| k.cerialize_offender_collection}  
        } 
    end
  
  def existing_offender
    Offender.find_by(id: params['id'])
  end

  def data_params
    params.require(:offender).permit(:full_name,:vehicle_no,
                                     :vehicle_type,:date_of_issue,
                                     :address,:city_town,:number_of_poeple,
                                     :phone_number,:ambolance_needed,:injured_people,
                                     :offense_ids,:toll_track_needed,:email,:offense_ids,
                                     :driver_liences_no,:statement)
  end
end
