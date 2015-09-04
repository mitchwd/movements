class MovementsController < ApplicationController
  before_action :set_movement, only: :show

  # GET /movements
  # GET /movements.json
  def index
    @movements = Movement.all
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /sign_in.json
  # Requests @movement.location_id and @movement.identifier_code
  # SAMPLE REQUEST:
    # curl -s -o /dev/null -w "%{http_code}" -H "Content-Type: application/json" -d '{"movement": {"location_id": "1", "identifier_code": "234"}}' http://localhost:3000/sign_in.json
    # -> 201 (Success: Record created)
  def sign_in
    @movement = Movement.new
    @movement.location = Location.where(id: movement_params[:location_id]).take!
    @movement.person = Identifier.where(code: movement_params[:identifier_code]).take!.person

    @movement.location.increment!(:current_capacity)

    respond_to do |format|
      if @movement.save
        format.json { render :show, status: :created, location: @movement }
      else
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movement_params
      params.require(:movement).permit(:person_id, :location_id, :notes, :identifier_code)
    end
end
