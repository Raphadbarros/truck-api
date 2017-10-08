class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all
    render json: @shipments, adapter: :json
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    render json: set_shipment, adapter: :json
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # POST /shipments
  # POST /shipments.json
  def create
    byebug
    @shipment = Shipment.new(shipment_params)

   # @shipment.each do |parent|
   #   parent.shipment_vehicle.create(type: "abc", body_type: "abc")
   # end


    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
       # @shipment.shipment_vehicle.create(type: "abc", body_type: "abc")
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json:shipment_params.as_json, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      byebug
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
