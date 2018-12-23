class LoanRegistrationsController < ApplicationController
  before_action :set_loan_registration, only: [:show, :edit, :update, :destroy]

  # GET /loan_registrations
  # GET /loan_registrations.json
  def index
    @loan_registrations = LoanRegistration.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")

  end

  # GET /loan_registrations/1
  # GET /loan_registrations/1.json
  def show
    @repayments = LoanManagement.where(loan_registration_id: @loan_registration.id).sum(:amount)
    @outstanding = @loan_registration.amount - @repayments
  end

  # GET /loan_registrations/new
  def new
    @loan_registration = LoanRegistration.new
  end

  # GET /loan_registrations/1/edit
  def edit
  end

  # POST /loan_registrations
  # POST /loan_registrations.json
  def create
    @loan_registration = LoanRegistration.new(loan_registration_params)

    respond_to do |format|
      if @loan_registration.save
        format.html { redirect_to @loan_registration, notice: 'Loan registration was successfully created.' }
        format.json { render :show, status: :created, location: @loan_registration }
      else
        format.html { render :new }
        format.json { render json: @loan_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_registrations/1
  # PATCH/PUT /loan_registrations/1.json
  def update
    respond_to do |format|
      if @loan_registration.update(loan_registration_params)
        format.html { redirect_to @loan_registration, notice: 'Loan registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_registration }
      else
        format.html { render :edit }
        format.json { render json: @loan_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_registrations/1
  # DELETE /loan_registrations/1.json
  def destroy
    @loan_registration.destroy
    respond_to do |format|
      format.html { redirect_to loan_registrations_url, notice: 'Loan registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_registration
      @loan_registration = LoanRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_registration_params
      params.require(:loan_registration).permit(:financialinstitution_id,:outstanding, :loan_type, :internal_loan,:loan_term, :rationale, :amount, :loan_reference, :drawdown_date, :final_payment_date, :user_id, :person_id)
    end
end
