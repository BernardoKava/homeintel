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
    @zero = 0.0
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


    # Annual income breakdown (Budget)

    @salary = @annual_income.where(inflowtype_id: 1).sum(:amount)
    @child_benefit = @annual_income.where(inflowtype_id: 2).sum(:amount)
    @lotto_winnings = @annual_income.where(inflowtype_id: 3).sum(:amount)
    @others = @annual_income.where(inflowtype_id: 4).sum(:amount)

    # Annual expense breakdown  (Budget)

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
    @other_expenses = @annual_expenses.where(outflowtype_id: 24).sum(:amount)
    @work_lunch = @annual_expenses.where(outflowtype_id: 25).sum(:amount)
    @pharmacy = @annual_expenses.where(outflowtype_id: 26).sum(:amount)
    @furniture = @annual_expenses.where(outflowtype_id: 27).sum(:amount)

    # Annual Inflows Breakdown (Cashflow)

    @isalary = @annual_inflow.where(inflowtype_id: 1).sum(:amount)
    @ichild_benefit = @annual_inflow.where(inflowtype_id: 2).sum(:amount)
    @ilotto_winnings = @annual_inflow.where(inflowtype_id: 3).sum(:amount)
    @iothers = @annual_inflow.where(inflowtype_id: 4).sum(:amount)

    # Annual outflows Breakdown (Cashflow)


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
    @iother_expenses = @annual_outflow.where(outflowtype_id: 24).sum(:amount)
    @iwork_lunch = @annual_outflow.where(outflowtype_id: 25).sum(:amount)
    @ipharmacy = @annual_outflow.where(outflowtype_id: 26).sum(:amount)
    @ifurniture = @annual_outflow.where(outflowtype_id: 27).sum(:amount)

    # save the breakdown into the table:

    @ledger.bud_inflow_salary = @salary
    @ledger.bud_inflow_child_benefit=@child_benefit
    @ledger.bud_inflow_lotto_winnings=@lotto_winnings
    @ledger.bud_inflow_other= @others
    @ledger.bud_outflow_rent=@rent
    @ledger.bud_outflow_telecom=@telecom
    @ledger.bud_outflow_eflow=@eflow
    @ledger.bud_outflow_food=@food
    @ledger.bud_outflow_electricity=@electricity
    @ledger.bud_outflow_transport=@transport
    @ledger.bud_outflow_credit_card_fees=@credit_card_fees
    @ledger.bud_outflow_current_account_fees=@current_account_fees
    @ledger.bud_outflow_allowance_gaelle=@allowance_gaelle
    @ledger.bud_outflow_allowance_herve=@allowance_herve
    @ledger.bud_outflow_loan_ptsb=@loan_ptsb
    @ledger.bud_outflow_loan_chill=@loan_chill_money
    @ledger.bud_outflow_lodgement_cu=@lodgement_credit_union
    @ledger.bud_outflow_family_support=@family_support
    @ledger.bud_outflow_entert_nightout=@entertainment_nightout
    @ledger.bud_outflow_entert_dayout=@entertainment_dayout
    @ledger.bud_outflow_apple_str=@apple_storage
    @ledger.bud_outflow_aa_irl=@aa_ireland
    @ledger.bud_outflow_lottery_ticket=@lottery_ticket
    @ledger.bud_outflow_car_tax=@car_tax
    @ledger.bud_outflow_heating_oil=@heating_oil
    @ledger.bud_outflow_car_service=@car_service
    @ledger.bud_outflow_spiritual_tools=@spiritual_tools
    @ledger.bud_outflow_work_lunch=@work_lunch
    @ledger.bud_outflow_pharmacy=@pharmacy
    @ledger.bud_outflow_furniture=@furniture
    @ledger.bud_outflow_other_exp=@other_expenses

    @ledger.act_inflow_salary = @isalary
    @ledger.act_inflow_child_benefit=@ichild_benefit
    @ledger.act_inflow_lotto_winnings=@ilotto_winnings
    @ledger.act_inflow_other= @iothers
    @ledger.act_outflow_rent=@irent
    @ledger.act_outflow_telecom=@itelecom
    @ledger.act_outflow_eflow=@ieflow
    @ledger.act_outflow_food=@ifood
    @ledger.act_outflow_electricity=@ielectricity
    @ledger.act_outflow_transport=@itransport
    @ledger.act_outflow_credit_card_fees=@icredit_card_fees
    @ledger.act_outflow_current_account_fees=@icurrent_account_fees
    @ledger.act_outflow_allowance_gaelle=@iallowance_gaelle
    @ledger.act_outflow_allowance_herve=@iallowance_herve
    @ledger.act_outflow_loan_ptsb=@iloan_ptsb
    @ledger.act_outflow_loan_chill=@iloan_chill_money
    @ledger.act_outflow_lodgement_cu=@ilodgement_credit_union
    @ledger.act_outflow_family_support=@ifamily_support
    @ledger.act_outflow_entert_nightout=@ientertainment_nightout
    @ledger.act_outflow_entert_dayout=@ientertainment_dayout
    @ledger.act_outflow_apple_str=@iapple_storage
    @ledger.act_outflow_aa_irl=@iaa_ireland
    @ledger.act_outflow_lottery_ticket=@ilottery_ticket
    @ledger.act_outflow_car_tax=@icar_tax
    @ledger.act_outflow_heating_oil=@iheating_oil
    @ledger.act_outflow_car_service=@icar_service
    @ledger.act_outflow_spiritual_tools=@ispiritual_tools
    @ledger.act_outflow_work_lunch=@iwork_lunch
    @ledger.act_outflow_pharmacy=@ipharmacy
    @ledger.act_outflow_furniture=@ifurniture
    @ledger.act_outflow_other_exp=@iother_expenses

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
      params.require(:ledger).permit(:month, :year, :ledger_date, :name, :user_id,:note)
    end
end
