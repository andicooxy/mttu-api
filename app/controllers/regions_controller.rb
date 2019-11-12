class RegionsController < AuthsController

  def index 
    # select all regions created
    render json: Region.all
  end
end
