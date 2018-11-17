class SavingReconsController < ApplicationController
  before_action :set_saving_recon, only: [:show, :edit, :update, :destroy]

  # GET /saving_recons
  # GET /saving_recons.json
  def index
    @saving_recons = SavingRecon.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /saving_recons/1
  # GET /saving_recons/1.json
  def show
  end

  # GET /saving_recons/new
  def new
    @saving_recon = SavingRecon.new
  end

  # GET /saving_recons/1/edit
  def edit
  end

  # POST /saving_recons
  # POST /saving_recons.json
  def create
    @saving_recon = SavingRecon.new(saving_recon_params)

    respond_to do |format|
      if @saving_recon.save
        format.html { redirect_to @saving_recon, notice: 'Saving recon was successfully created.' }
        format.json { render :show, status: :created, location: @saving_recon }
      else
        format.html { render :new }
        format.json { render json: @saving_recon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saving_recons/1
  # PATCH/PUT /saving_recons/1.json
  def update
    respond_to do |format|
      if @saving_recon.update(saving_recon_params)
        format.html { redirect_to @saving_recon, notice: 'Saving recon was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving_recon }
      else
        format.html { render :edit }
        format.json { render json: @saving_recon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saving_recons/1
  # DELETE /saving_recons/1.json
  def destroy
    @saving_recon.destroy
    respond_to do |format|
      format.html { redirect_to saving_recons_url, notice: 'Saving recon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving_recon
      @saving_recon = SavingRecon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_recon_params
      params.require(:saving_recon).permit(:saving_id,:person_id, :user_id, :error_details, :reconciliation_rationale, :correction_amount, :authorised_by, :authorisation_date)
    end
end
