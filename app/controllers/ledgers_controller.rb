class LedgersController < ApplicationController
  before_action :set_ledger, only: [:show, :edit, :update, :destroy]

  # GET /ledgers
  # GET /ledgers.json
  def index
    @ledgers = Ledger.all.paginate(page: params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /ledgers/1
  # GET /ledgers/1.json
  def show
    @zero = 0
    @over_budget_message = "Alert: Exceeded Budgeted Expenditure"
    @under_budget_message = "Notice: Within Planned Expenditure"
    @year= @ledger.ledger_date.year
    @month= @ledger.ledger_date.month
    @ledger.year=@year
    @ledger.month = @month
    @ref = @year

    @budget_balance = Budget.where(year: @ref).sum(:balance)
    @cashflow_balance = Cashflow.where(year: @ref).sum(:balance)
    @saving_balance = Saving.where(year: @ref).sum(:balance)

    @budget_vs_cashflow = @budget_balance - @cashflow_balance
    @cashflow_balance_plus_saving_balance = @saving_balance + @cashflow_balance

    @ledger.annual_budget_bal=@budget_balance
    @ledger.annual_cashflow_bal=@cashflow_balance
    @ledger.annual_saving_bal=@saving_balance

    @annual_total_inflow = Inflow.where(year: @year, month: @month).sum(:amount)
    @annual_total_outflow = Outflow.where(year: @year, month: @month).sum(:amount)

    @ledger.annual_total_income=@annual_total_inflow
    @ledger.annual_total_expenditure=@annual_total_outflow

    # Ledger number
    @ledger_number =  (@ledger.id + 10000 )
    @ledger.ledger_number = @ledger_number

    @ledger.save
  end



  # GET /ledgers/new
  def new
    @ledger = Ledger.new
  end

  # GET /ledgers/1/edit
  def edit
  end

  # POST /ledgers
  # POST /ledgers.json
  def create
    @ledger = Ledger.new(ledger_params)

    respond_to do |format|
      if @ledger.save
        format.html { redirect_to @ledger, notice: 'Ledger was successfully created.' }
        format.json { render :show, status: :created, location: @ledger }
      else
        format.html { render :new }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ledgers/1
  # PATCH/PUT /ledgers/1.json
  def update
    respond_to do |format|
      if @ledger.update(ledger_params)
        format.html { redirect_to @ledger, notice: 'Ledger was successfully updated.' }
        format.json { render :show, status: :ok, location: @ledger }
      else
        format.html { render :edit }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ledgers/1
  # DELETE /ledgers/1.json
  def destroy
    @ledger.destroy
    respond_to do |format|
      format.html { redirect_to ledgers_url, notice: 'Ledger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger
      @ledger = Ledger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ledger_params
      params.require(:ledger).permit(:month, :year, :ledger_date, :name, :user_id)
    end
end
