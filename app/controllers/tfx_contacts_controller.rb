class TfxContactsController < ApplicationController
  before_action :set_tfx_contact, only: [:show, :edit, :update, :destroy]

  # GET /tfx_contacts
  # GET /tfx_contacts.json
  def index
    @tfx_contacts = TfxContact.all
  end

  # GET /tfx_contacts/1
  # GET /tfx_contacts/1.json
  def show
  end

  # GET /tfx_contacts/new
  def new
    @tfx_contact = TfxContact.new
  end

  # GET /tfx_contacts/1/edit
  def edit
  end

  # POST /tfx_contacts
  # POST /tfx_contacts.json
  def create
    @tfx_contact = TfxContact.new(tfx_contact_params)

    respond_to do |format|
      if @tfx_contact.save
        format.html { redirect_to @tfx_contact, notice: 'Tfx contact was successfully created.' }
        format.json { render :show, status: :created, location: @tfx_contact }
      else
        format.html { render :new }
        format.json { render json: @tfx_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tfx_contacts/1
  # PATCH/PUT /tfx_contacts/1.json
  def update
    respond_to do |format|
      if @tfx_contact.update(tfx_contact_params)
        format.html { redirect_to @tfx_contact, notice: 'Tfx contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @tfx_contact }
      else
        format.html { render :edit }
        format.json { render json: @tfx_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tfx_contacts/1
  # DELETE /tfx_contacts/1.json
  def destroy
    @tfx_contact.destroy
    respond_to do |format|
      format.html { redirect_to tfx_contacts_url, notice: 'Tfx contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tfx_contact
      @tfx_contact = TfxContact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tfx_contact_params
      params.require(:tfx_contact).permit(:FirstName, :LastName, :Email, :UserID, :Password, :Phone, :Expires)
    end
end
