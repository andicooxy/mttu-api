class UsersController < AuthsController
  def create
    begin
      render json: User.create!(data_params)
    rescue => exception
      render json: exception, status: :unprocessable_entity
    end
  end
  
  def show
    render json: existing_User
  end

  def index 
    users = User.order('created_at ASC') 
                .paginate(per_page: params[:limit] || 30 , page: params[:page] || 1)                                                        
    render json: summary(users)
  end
  
  def update 
    begin
        existing_user.update!(data_params)
        render json: existing_user   
    rescue => exception
        render json: exception, status: :unprocessable_entity
    end 
  end
  
  def destroy    
    begin
        existing_user.destroy!
        head :no_content 
    rescue => exception
        render json: exception, status: :unprocessable_entity
    end 
  end
  
  protected
    def summary(data)           
        {current_page:  data.current_page,
         current_page_total:  data.length,
         total_pages:  data.total_pages,
         total_filtered:  data.total_entries,
         uses: data.map{|k| k.cerialize_users_collection}  
        } 
    end
  
  def existing_user
    User.find_by(id: params['id'])
  end

  def data_params
    params.require(:user).permit(:full_name, :password, :department_id,:designation, :region_id)
  end
end
