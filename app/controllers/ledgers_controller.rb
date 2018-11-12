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
    @over_budget_message = "Alert: Exceeded Budgeted Expenditure. Please check budget and cashflow Dr and Cr. If necessary please reconcile."
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

    @annual_total_inflow = Inflow.where(year: @year).sum(:amount)
    @annual_total_outflow = Outflow.where(year: @year).sum(:amount)
    @annual_total_income = Income.where(year: @year).sum(:amount)
    @annual_total_expenses = Expense.where(year: @year).sum(:amount)

    @ledger.annual_total_income=@annual_total_inflow
    @ledger.annual_total_expenditure=@annual_total_outflow

    # Ledger number
    @ledger_number =  (@ledger.id + 10000 )
    @ledger.ledger_number = @ledger_number

    @ledger.save


    # Annual breakdowns
    @annual_income = Income.where(year: @year)
    @annual_expenses =  Expense.where(year: @year)

    @annual_inflow = Inflow.where(year: @year)
    @annual_outflow = Outflow.where(year: @year)


    # Annual income breakdown

    @salary = @annual_income.where(inflowtype_id: 1).sum(:amount)
    @child_benefit = @annual_income.where(inflowtype_id: 2).sum(:amount)
    @lotto_winnings = @annual_income.where(inflowtype_id: 3).sum(:amount)
    @others = @annual_income.where(inflowtype_id: 4).sum(:amount)

    # Annual expense breakdown

    @rent = @annual_expenses.where(outflowtype_id: 1).sum(:amount)
    @telecom = @annual_expenses.where(outflowtype_id: 2).sum(:amount)
    @eflow = @annual_expenses.where(outflowtype_id: 3).sum(:amount)
    @food = @annual_expenses.where(outflowtype_id: 4).sum(:amount)
    @electricity = @annual_expenses.where(outflowtype_id: 5).sum(:amount)
    @transport = @annual_expenses.where(outflowtype_id: 6).sum(:amount)
    @credit_card_fees = @annual_expenses.where(outflowtype_id: 7).sum(:amount)
    @current_account_fees = @annual_expenses.where(outflowtype_id: 8).sum(:amount)
    @allowance_gaelle = @annual_expenses.where(outflowtype_id: 9).sum(:amount)
    @allowance_herve = @annual_expenses.where(outflowtype_id: 10).sum(:amount)
    @loan_ptsb = @annual_expenses.where(outflowtype_id: 11).sum(:amount)
    @loan_chill_money = @annual_expenses.where(outflowtype_id: 12).sum(:amount)
    @lodgement_credit_union = @annual_expenses.where(outflowtype_id: 13).sum(:amount)
    @family_support = @annual_expenses.where(outflowtype_id: 14).sum(:amount)
    @entertainment_nightout = @annual_expenses.where(outflowtype_id: 15).sum(:amount)
    @entertainment_dayout = @annual_expenses.where(outflowtype_id: 16).sum(:amount)
    @apple_storage = @annual_expenses.where(outflowtype_id: 17).sum(:amount)
    @aa_ireland = @annual_expenses.where(outflowtype_id: 18).sum(:amount)
    @lottery_ticket = @annual_expenses.where(outflowtype_id: 19).sum(:amount)
    @car_tax = @annual_expenses.where(outflowtype_id: 20).sum(:amount)
    @heating_oil = @annual_expenses.where(outflowtype_id: 21).sum(:amount)
    @car_service = @annual_expenses.where(outflowtype_id: 22).sum(:amount)
    @spiritual_tools = @annual_expenses.where(outflowtype_id: 23).sum(:amount)
    @other_expenses = @expenses.where(outflowtype_id: 24).sum(:amount)

    # Annual Inflows Breakdown

    @isalary = @annual_inflow.where(inflowtype_id: 1).sum(:amount)
    @ichild_benefit = @annual_inflow.where(inflowtype_id: 2).sum(:amount)
    @ilotto_winnings = @annual_inflow.where(inflowtype_id: 3).sum(:amount)
    @iothers = @annual_inflow.where(inflowtype_id: 4).sum(:amount)

    # Annual outflows Breakdown


    @irent = @annual_outflow.where(outflowtype_id: 1).sum(:amount)
    @itelecom = @annual_outflow.where(outflowtype_id: 2).sum(:amount)
    @ieflow = @annual_outflow.where(outflowtype_id: 3).sum(:amount)
    @ifood = @annual_outflow.where(outflowtype_id: 4).sum(:amount)
    @ielectricity = @annual_outflow.where(outflowtype_id: 5).sum(:amount)
    @itransport = @annual_outflow.where(outflowtype_id: 6).sum(:amount)
    @icredit_card_fees = @annual_outflow.where(outflowtype_id: 7).sum(:amount)
    @icurrent_account_fees = @annual_outflow.where(outflowtype_id: 8).sum(:amount)
    @iallowance_gaelle = @annual_outflow.where(outflowtype_id: 9).sum(:amount)
    @iallowance_herve = @annual_outflow.where(outflowtype_id: 10).sum(:amount)
    @iloan_ptsb = @annual_outflow.where(outflowtype_id: 11).sum(:amount)
    @iloan_chill_money = @annual_outflow.where(outflowtype_id: 12).sum(:amount)
    @ilodgement_credit_union = @annual_outflow.where(outflowtype_id: 13).sum(:amount)
    @ifamily_support = @annual_outflow.where(outflowtype_id: 14).sum(:amount)
    @ientertainment_nightout = @annual_outflow.where(outflowtype_id: 15).sum(:amount)
    @ientertainment_dayout = @annual_outflow.where(outflowtype_id: 16).sum(:amount)
    @iapple_storage = @annual_outflow.where(outflowtype_id: 17).sum(:amount)
    @iaa_ireland = @annual_outflow.where(outflowtype_id: 18).sum(:amount)
    @ilottery_ticket = @annual_outflow.where(outflowtype_id: 19).sum(:amount)
    @icar_tax = @annual_outflow.where(outflowtype_id: 20).sum(:amount)
    @iheating_oil = @annual_outflow.where(outflowtype_id: 21).sum(:amount)
    @icar_service = @annual_outflow.where(outflowtype_id: 22).sum(:amount)
    @ispiritual_tools = @annual_outflow.where(outflowtype_id: 23).sum(:amount)
    @iother_expenses = @expenses.where(outflowtype_id: 24).sum(:amount)
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
