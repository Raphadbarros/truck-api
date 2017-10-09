class TruckersController < ApplicationController
  # GET /truckers
  # GET /truckers.json

  def index
    @truckers = Trucker.all
    render json: @truckers, adapter: :json
  end

  # GET /truckers/1
  # GET /truckers/1.json
  def show
    begin
      @trucker = Trucker.find(params[:id])
      render json: @trucker, adapter: :json
    rescue
      render json: ({errors: "Caminhoneiro não encontrado"}),adapter: :json, status: :unprocessable_entity 
    end
  end

  # POST /truckers
  # POST /truckers.json
  def create
    @trucker = Trucker.new(trucker_params)
      if @trucker.save
        render :show, status: :created, location: @trucker 
      else
        render json: @trucker.errors, status: :unprocessable_entity 
      end
  end

  def last_location
    begin
      trucker = Trucker.find(params[:id])
      @last_location = LastLocation.new last_location_params.merge(trucker_id:trucker.id)
       if @last_location.save
         render json: @last_location, adapter: :json
       else
         render json: {errors: @last_location.errors.full_messages}, adapter: :json
       end
    rescue
      render json: {errors: "Caminhoneiro não encontrado"}, status: :unprocessable_entity

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def trucker_params
      params[:trucker][:vehicle_attributes] = [params[:trucker][:vehicle]]
      params.require(:trucker).delete :vehicle
      params.require(:trucker).permit(:name, :phone, vehicle_attributes: [:body_type, :type])
    end

    def last_location_params
      params.require(:location).permit(:city, :state, :trucker_id)
    end
end
