class CashflowReconsController < ApplicationController
  before_action :set_cashflow_recon, only: [:show, :edit, :update, :destroy]

  # GET /cashflow_recons
  # GET /cashflow_recons.json
  def index
    @cashflow_recons = CashflowRecon.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /cashflow_recons/1
  # GET /cashflow_recons/1.json
  def show
  end

  # GET /cashflow_recons/new
  def new
    @cashflow_recon = CashflowRecon.new
  end

  # GET /cashflow_recons/1/edit
  def edit
  end

  # POST /cashflow_recons
  # POST /cashflow_recons.json
  def create
    @cashflow_recon = CashflowRecon.new(cashflow_recon_params)

    respond_to do |format|
      if @cashflow_recon.save
        format.html { redirect_to @cashflow_recon, notice: 'Cashflow recon was successfully created.' }
        format.json { render :show, status: :created, location: @cashflow_recon }
      else
        format.html { render :new }
        format.json { render json: @cashflow_recon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashflow_recons/1
  # PATCH/PUT /cashflow_recons/1.json
  def update
    respond_to do |format|
      if @cashflow_recon.update(cashflow_recon_params)
        format.html { redirect_to @cashflow_recon, notice: 'Cashflow recon was successfully updated.' }
        format.json { render :show, status: :ok, location: @cashflow_recon }
      else
        format.html { render :edit }
        format.json { render json: @cashflow_recon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashflow_recons/1
  # DELETE /cashflow_recons/1.json
  def destroy
    @cashflow_recon.destroy
    respond_to do |format|
      format.html { redirect_to cashflow_recons_url, notice: 'Cashflow recon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashflow_recon
      @cashflow_recon = CashflowRecon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cashflow_recon_params
      params.require(:cashflow_recon).permit(:cashflow_id,:person_id, :user_id, :error_details, :reconciliation_rationale, :correction_amount, :authorised_by, :authorisation_date)
    end
end
