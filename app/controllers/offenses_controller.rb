class OffensesController < AuthsController
  before_action :set_offense, only: [:show, :update, :destroy]

  # GET /offenses
  # GET /offenses.json
  def index
    @offenses = Offense.all
  end

  # GET /offenses/1
  # GET /offenses/1.json
  def show
  end

  # POST /offenses
  # POST /offenses.json
  def create
    @offense = Offense.new(offense_params)

    if @offense.save
      render :show, status: :created, location: @offense
    else
      render json: @offense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offenses/1
  # PATCH/PUT /offenses/1.json
  def update
    if @offense.update(offense_params)
      render :show, status: :ok, location: @offense
    else
      render json: @offense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offenses/1
  # DELETE /offenses/1.json
  def destroy
    @offense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offense
      @offense = Offense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offense_params
      params.fetch(:offense, {}).permit(:name, :description)
    end
end
