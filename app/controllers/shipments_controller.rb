class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show]

  # GET /shipments
  # GET /shipments.json
  def narby_truckers
    begin
      @origin = Origin.joins(:shipment).find_by(shipment_id: params[:id])
      @nearby = LastLocation.includes(:trucker).joins(:trucker).find_by(city: @origin.city, state: @origin.state)
      #nearby = LastLocation.all.where "city like ?", "%#{@origin.city}%"
      #@trucker = 
      render json: @nearby.trucker, adapter: :json  
    rescue
      render json: {errors: "Não localizados caminhoneiros por perto"}, status: :unprocessable_entity
    end

  end

  def index
    @shipments = Shipment.all
    render json: @shipments, adapter: :json
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    render json: set_shipment, adapter: :json
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)
      if @shipment.save
        format.json  render :show, status: :created, location: @shipment 
      else
         render json: ({errors: @shipment.errors}), status: :unprocessable_entity 
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      begin
        @shipment = Shipment.find(params[:id])
      rescue
        render json: ({errors: "Não foi localizado pedido(s)"}), status: :unprocessable_entity 
      end
    end

    def shipment_params

      params[:shipment][:shipment_vehicle_attributes] = params[:shipment][:vehicles]
      params[:shipment][:contact_attributes] = params[:shipment][:contact]
      params[:shipment][:origin_attributes] = params[:shipment][:origin]
      params[:shipment][:destination_attributes] = params[:shipment][:destination]
      params.require(:shipment).delete :vehicles
      params.require(:shipment).delete :contact
      params.require(:shipment).delete :origin
      params.require(:shipment).delete :destination
      params.require(:shipment).permit(get_permit)

    end

    def get_permit
      [:value, 
      :weight_kg, 
      shipment_vehicle_attributes:[:type, :body_type], 
      contact_attributes:[:name, :phone],
      origin_attributes: [:city, :state, :load_at],
      destination_attributes:[:city, :state, :deliver_at]      
      ]
    end
end
