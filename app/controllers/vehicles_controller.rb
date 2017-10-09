class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render :show, status: :created, location: @vehicle 
      else
        render json: @vehicle.errors, status: :unprocessable_entity 
      end
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:type, :body_type, :trucker_id)
    end
end
