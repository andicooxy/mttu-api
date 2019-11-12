class UsersController < ApplicationController
  def create
    render json: User.create!(data_params)
  end
  
  def show
    render json: existing_User
  end

  def index 
    render json: User.all
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
  
  def existing_User
    User.find(params['id'])
  end

  def data_params
    params.require(:data).permit(:title, :performer, :cost)
  end
end
