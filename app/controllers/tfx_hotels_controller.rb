class TfxHotelsController < ApplicationController
  before_action :set_tfx_hotel, only: [:show, :edit, :update, :destroy]

  # GET /tfx_hotels
  # GET /tfx_hotels.json
  def index
    @tfx_hotels = TfxHotel.all
  end

  # GET /tfx_hotels/1
  # GET /tfx_hotels/1.json
  def show
  end

  # GET /tfx_hotels/new
  def new
    @tfx_hotel = TfxHotel.new
  end

  # GET /tfx_hotels/1/edit
  def edit
  end

  # POST /tfx_hotels
  # POST /tfx_hotels.json
  def create
    @tfx_hotel = TfxHotel.new(tfx_hotel_params)

    respond_to do |format|
      if @tfx_hotel.save
        format.html { redirect_to @tfx_hotel, notice: 'Tfx hotel was successfully created.' }
        format.json { render :show, status: :created, location: @tfx_hotel }
      else
        format.html { render :new }
        format.json { render json: @tfx_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tfx_hotels/1
  # PATCH/PUT /tfx_hotels/1.json
  def update
    respond_to do |format|
      if @tfx_hotel.update(tfx_hotel_params)
        format.html { redirect_to @tfx_hotel, notice: 'Tfx hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @tfx_hotel }
      else
        format.html { render :edit }
        format.json { render json: @tfx_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tfx_hotels/1
  # DELETE /tfx_hotels/1.json
  def destroy
    @tfx_hotel.destroy
    respond_to do |format|
      format.html { redirect_to tfx_hotels_url, notice: 'Tfx hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tfx_hotel
      @tfx_hotel = TfxHotel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tfx_hotel_params
      params.require(:tfx_hotel).permit(:HotelID, :HotelChainID, :SiteID, :ShortName, :Name, :Address, :Address2, :City, :State, :Zip, :Country, :DateCreated, :Phone)
    end
end
