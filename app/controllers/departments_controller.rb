class DepartmentsController < AuthsController
  
  def index 
    render json: Department.all
  end
end
