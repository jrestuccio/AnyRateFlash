class TfxCorporateCustomersController < ApplicationController
  before_action :set_tfx_corporate_customer, only: [:show, :edit, :update, :destroy]

  # GET /tfx_corporate_customers
  # GET /tfx_corporate_customers.json
  def index
    @tfx_corporate_customers = TfxCorporateCustomer.all
  end

  # GET /tfx_corporate_customers/1
  # GET /tfx_corporate_customers/1.json
  def show
  end

  # GET /tfx_corporate_customers/new
  def new
    @tfx_corporate_customer = TfxCorporateCustomer.new
  end

  # GET /tfx_corporate_customers/1/edit
  def edit
  end

  # POST /tfx_corporate_customers
  # POST /tfx_corporate_customers.json
  def create
    @tfx_corporate_customer = TfxCorporateCustomer.new(tfx_corporate_customer_params)

    respond_to do |format|
      if @tfx_corporate_customer.save
        format.html { redirect_to @tfx_corporate_customer, notice: 'Tfx corporate customer was successfully created.' }
        format.json { render :show, status: :created, location: @tfx_corporate_customer }
      else
        format.html { render :new }
        format.json { render json: @tfx_corporate_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tfx_corporate_customers/1
  # PATCH/PUT /tfx_corporate_customers/1.json
  def update
    respond_to do |format|
      if @tfx_corporate_customer.update(tfx_corporate_customer_params)
        format.html { redirect_to @tfx_corporate_customer, notice: 'Tfx corporate customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tfx_corporate_customer }
      else
        format.html { render :edit }
        format.json { render json: @tfx_corporate_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tfx_corporate_customers/1
  # DELETE /tfx_corporate_customers/1.json
  def destroy
    @tfx_corporate_customer.destroy
    respond_to do |format|
      format.html { redirect_to tfx_corporate_customers_url, notice: 'Tfx corporate customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tfx_corporate_customer
      @tfx_corporate_customer = TfxCorporateCustomer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tfx_corporate_customer_params
      params.require(:tfx_corporate_customer).permit(:C_CustomerID, :C_LoginCode, :C_CustomerChainID, :C_CustomerName, :Address1, :Address2, :City, :State, :Zip, :Phone)
    end
end
