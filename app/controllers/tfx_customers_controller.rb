class TfxCustomersController < ApplicationController
  before_action :set_tfx_customer, only: [:show, :edit, :update, :destroy]

  # GET /tfx_customers
  # GET /tfx_customers.json
  def index
    @tfx_customers = TfxCustomer.all
  end

  # GET /tfx_customers/1
  # GET /tfx_customers/1.json
  def show
  end

  # GET /tfx_customers/new
  def new
    @tfx_customer = TfxCustomer.new
  end

  # GET /tfx_customers/1/edit
  def edit
  end

  # POST /tfx_customers
  # POST /tfx_customers.json
  def create
    @tfx_customer = TfxCustomer.new(tfx_customer_params)

    respond_to do |format|
      if @tfx_customer.save
        format.html { redirect_to @tfx_customer, notice: 'Tfx customer was successfully created.' }
        format.json { render :show, status: :created, location: @tfx_customer }
      else
        format.html { render :new }
        format.json { render json: @tfx_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tfx_customers/1
  # PATCH/PUT /tfx_customers/1.json
  def update
    respond_to do |format|
      if @tfx_customer.update(tfx_customer_params)
        format.html { redirect_to @tfx_customer, notice: 'Tfx customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tfx_customer }
      else
        format.html { render :edit }
        format.json { render json: @tfx_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tfx_customers/1
  # DELETE /tfx_customers/1.json
  def destroy
    @tfx_customer.destroy
    respond_to do |format|
      format.html { redirect_to tfx_customers_url, notice: 'Tfx customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tfx_customer
      @tfx_customer = TfxCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tfx_customer_params
      params.require(:tfx_customer).permit(:CustoemrID, :LoginCode, :CustomerChainID, :CustomerName, :CustomerSiteID, :Address1, :Address2, :City, :State, :Zip, :Phone, :HostHotelID, :C_CustomerID, :CountryCode)
    end
end
