class OffensesController < AuthsController
  def create
    begin
      offense = Offense.new(data_params)
      offense.user_id = params[:user_id]
      offense.save!
      render json:  offense.cerialize
    rescue => exception
      render json: exception, status: :unprocessable_entity
    end
  end
  
  def show
    offense = existing_offense
    if offense
      existing_offense.update!(data_params)
      render json: offense.cerialize
    else
      render json: :'resource not found', status:  404
    end
  end

  def index 
    offenses = Offense.order('created_at ASC') 
                     .paginate(per_page: params[:limit] || 30 , page: params[:page] || 1)                                                        
    render json: summary(offenses)
  end
  
  def update
    offense = existing_offense
    if offense
      existing_offense.update!(data_params)
      render json: offense.cerialize
    else
      render json: :'resource not found', status:  404
    end
  end
  
  def destroy
    offense = existing_offense
    if offense
      existing_offense.destroy!
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
         offense: data.map{|k| k.cerialize_offense_collection}  
        } 
    end
  
  def existing_offense
    Offense.find_by(id: params['id'])
  end

  def data_params
    params.require(:offense).permit(:title,:description)
  end
end
