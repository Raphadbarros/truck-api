class TruckersController < ApplicationController
  before_action :set_trucker, only: [:show, :edit, :update, :destroy]

  # GET /truckers
  # GET /truckers.json
  def index
    @truckers = Trucker.all
    
    #teste = {trucker: {name: "Lincoln Falcão", phone: "(11) 97654-3210", vehicles_attributes: [{body_type: "Baú", type: "Truck"}]}}
   # byebug
   # puts teste
    #@trucker = Trucker.new(teste[:trucker])
    #@trucker.save
    #@truckers = Trucker.all
    render json: @truckers, adapter: :json

  end

  # GET /truckers/1
  # GET /truckers/1.json
  def show
    @trucker = Trucker.find(params[:id])
    render json: @trucker, adapter: :json
  end

  # GET /truckers/new
  def new
    @trucker = Trucker.new
  end

  # GET /truckers/1/edit
  def edit
  end

  # POST /truckers
  # POST /truckers.json
  def create
    byebug
    @trucker = Trucker.new(trucker_params)

    respond_to do |format|
      if @trucker.save
        format.html { redirect_to @trucker, notice: 'Trucker was successfully created.' }
        format.json { render :show, status: :created, location: @trucker }
      else
        format.html { render :new }
        format.json { render json: @trucker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /truckers/1
  # PATCH/PUT /truckers/1.json
  def update
    respond_to do |format|
      if @trucker.update(trucker_params)
        format.html { redirect_to @trucker, notice: 'Trucker was successfully updated.' }
        format.json { render :show, status: :ok, location: @trucker }
      else
        format.html { render :edit }
        format.json { render json: @trucker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /truckers/1
  # DELETE /truckers/1.json
  def destroy
    @trucker.destroy
    respond_to do |format|
      format.html { redirect_to truckers_url, notice: 'Trucker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trucker
      @trucker = Trucker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trucker_params
      byebug
      params[:trucker][:vehicle_attributes] = [params[:trucker][:vehicle]]
      params.require(:trucker).delete :vehicle
      params.require(:trucker).permit(:name, :phone, vehicle_attributes: [:body_type, :type])
    end
end
