class UsersController < AuthsController
  def create
    render json: User.create!(data_params)
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
    existing_User.update!(data_params)
    render json: existing_User    
  end
  
  def destroy
    existing_User.destroy!
    head :no_content
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
  
  def existing_User
    User.find(params['id'])
  end

  def data_params
    params.require(:data).permit(:full_name, :password, :department_id, :region_id, :user_type_id)
  end
end
