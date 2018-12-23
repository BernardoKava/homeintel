class LoanManagementsController < ApplicationController
  before_action :set_loan_management, only: [:show, :edit, :update, :destroy]

  # GET /loan_managements
  # GET /loan_managements.json
  def index
    @loan_managements = LoanManagement.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
  end

  # GET /loan_managements/1
  # GET /loan_managements/1.json
  def show
    @ref = @loan_management.loan_registration.id
    @year= @loan_management.payment_date.year
    @month = @loan_management.payment_date.month


    @loan_management.year = @year
    @loan_management.month = @month


    @borrowed_amount = LoanRegistration.where(id: @ref).sum(:amount)
    @loan_managements = LoanManagement.all
    @repayment_aggregate = LoanManagement.where(loan_registration_id: @ref).sum(:amount)
    @outstanding = (@loan_management.loan_registration.amount)-(@repayment_aggregate)


    @loan_management.save

  end

  # GET /loan_managements/new
  def new
    @loan_management = LoanManagement.new

  end

  # GET /loan_managements/1/edit
  def edit
  end

  # POST /loan_managements
  # POST /loan_managements.json
  def create
    @loan_management = LoanManagement.new(loan_management_params)

    respond_to do |format|
      if @loan_management.save
        format.html { redirect_to @loan_management, notice: 'Loan management was successfully created.' }
        format.json { render :show, status: :created, location: @loan_management }
      else
        format.html { render :new }
        format.json { render json: @loan_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loan_managements/1
  # PATCH/PUT /loan_managements/1.json
  def update
    respond_to do |format|
      if @loan_management.update(loan_management_params)
        format.html { redirect_to @loan_management, notice: 'Loan management was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan_management }
      else
        format.html { render :edit }
        format.json { render json: @loan_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_managements/1
  # DELETE /loan_managements/1.json
  def destroy
    @loan_management.destroy
    respond_to do |format|
      format.html { redirect_to loan_managements_url, notice: 'Loan management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan_management
      @loan_management = LoanManagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_management_params
      params.require(:loan_management).permit(:year, :month, :loan_registration_id, :payment_date, :amount, :note, :user_id)
    end
end
