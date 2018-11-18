class CashflowsController < ApplicationController
  before_action :set_cashflow, only: [:show, :edit, :update, :destroy]

  # GET /cashflows
  # GET /cashflows.json
  def index
    @cashflows = Cashflow.all.paginate(page: params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /cashflows/1
  # GET /cashflows/1.json
  def show

    # define month and year
    @year= @cashflow.accounting_date.year
    @month= @cashflow.accounting_date.month
    @cashflow.year=@year
    @cashflow.month = @month

    # get widrawals and lodgement where the month and the year is the same as the and year of the current cashflow
    @cash_injection = Withdrawal.where(year: @year, month: @month).sum(:amount)
    @saving_lodgement = Lodgement.where(year: @year, month: @month).sum(:amount)
    # Only retieve inflows and outflows where the cashflow id belongs to the current cashflow
    @ref = @cashflow.id
    @totalinflow = Inflow.where(cashflow_id: @ref).sum(:amount)
    @totaloutflow = Outflow.where(cashflow_id: @ref).sum(:amount)

    # inflow outflow tabels
    @inflows = Inflow.where(cashflow_id: @ref).order("date_posted DESC")
    @outflows = Outflow.where(cashflow_id: @ref).order("date_posted DESC")

    # reconciliation calc

    @recons = CashflowRecon.where(cashflow_id: @ref).sum(:correction_amount)



    # balance calculation
    @i = 0
    @balance = (((@totalinflow - @saving_lodgement)- @totaloutflow) + @cash_injection) + @recons
    @cashflow.balance= @balance

    # savings dashboard
    @savings = Saving.where(year: @year, month: @month).sum(:balance)

    # budget balance
    @budgets = Budget.where(year: @year, month: @month).sum(:balance)
    # Cashflow number
    @cashflow_number =  (@cashflow.id + 10000 )
    @cashflow.cashflow_number = @cashflow_number

    #save whatever can be saved on the table
    @cashflow.save

    # Totals income breakdownAmounts

    @salary = @inflows.where(inflowtype_id: 1).sum(:amount)
    @child_benefit = @inflows.where(inflowtype_id: 2).sum(:amount)
    @lotto_winnings = @inflows.where(inflowtype_id: 3).sum(:amount)
    @others = @inflows.where(inflowtype_id: 4).sum(:amount)


    # Totals expense breakdownAmounts

    @rent = @outflows.where(outflowtype_id: 1).sum(:amount)
    @telecom = @outflows.where(outflowtype_id: 2).sum(:amount)
    @eflow = @outflows.where(outflowtype_id: 3).sum(:amount)
    @food = @outflows.where(outflowtype_id: 4).sum(:amount)
    @electricity = @outflows.where(outflowtype_id: 5).sum(:amount)
    @transport = @outflows.where(outflowtype_id: 6).sum(:amount)
    @credit_card_fees = @outflows.where(outflowtype_id: 7).sum(:amount)
    @current_account_fees = @outflows.where(outflowtype_id: 8).sum(:amount)
    @allowance_gaelle = @outflows.where(outflowtype_id: 9).sum(:amount)
    @allowance_herve = @outflows.where(outflowtype_id: 10).sum(:amount)
    @loan_ptsb = @outflows.where(outflowtype_id: 11).sum(:amount)
    @loan_chill_money = @outflows.where(outflowtype_id: 12).sum(:amount)
    @lodgement_credit_union = @outflows.where(outflowtype_id: 13).sum(:amount)
    @family_support = @outflows.where(outflowtype_id: 14).sum(:amount)
    @entertainment_nightout = @outflows.where(outflowtype_id: 15).sum(:amount)
    @entertainment_dayout = @outflows.where(outflowtype_id: 16).sum(:amount)
    @apple_storage = @outflows.where(outflowtype_id: 17).sum(:amount)
    @aa_ireland = @outflows.where(outflowtype_id: 18).sum(:amount)
    @lottery_ticket = @outflows.where(outflowtype_id: 19).sum(:amount)
    @car_tax = @outflows.where(outflowtype_id: 20).sum(:amount)
    @heating_oil = @outflows.where(outflowtype_id: 21).sum(:amount)
    @car_service = @outflows.where(outflowtype_id: 22).sum(:amount)
    @spiritual_tools = @outflows.where(outflowtype_id: 23).sum(:amount)
    @other_expenses = @outflows.where(outflowtype_id: 24).sum(:amount)
    @work_lunch = @outflows.where(outflowtype_id: 25).sum(:amount)
    @pharmacy = @outflows.where(outflowtype_id: 26).sum(:amount)
    @furniture = @outflows.where(outflowtype_id: 27).sum(:amount)

    # save the breakdown into the table:

    @cashflow.inflow_salary = @salary
    @cashflow.inflow_child_benefit=@child_benefit
    @cashflow.inflow_lotto_winnings=@lotto_winnings
    @cashflow.inflow_other= @others
    @cashflow.outflow_rent=@rent
    @cashflow.outflow_telecom=@telecom
    @cashflow.outflow_eflow=@eflow
    @cashflow.outflow_food=@food
    @cashflow.outflow_electricity=@electricity
    @cashflow.outflow_transport=@transport
    @cashflow.outflow_credit_card_fees=@credit_card_fees
    @cashflow.outflow_current_account_fees=@current_account_fees
    @cashflow.outflow_allowance_gaelle=@allowance_gaelle
    @cashflow.outflow_allowance_herve=@allowance_herve
    @cashflow.outflow_loan_ptsb=@loan_ptsb
    @cashflow.outflow_loan_chill=@loan_chill_money
    @cashflow.outflow_lodgement_cu=@lodgement_credit_union
    @cashflow.outflow_family_support=@family_support
    @cashflow.outflow_entert_nightout=@entertainment_nightout
    @cashflow.outflow_entert_dayout=@entertainment_dayout
    @cashflow.outflow_apple_str=@apple_storage
    @cashflow.outflow_aa_irl=@aa_ireland
    @cashflow.outflow_lottery_ticket=@lottery_ticket
    @cashflow.outflow_car_tax=@car_tax
    @cashflow.outflow_heating_oil=@heating_oil
    @cashflow.outflow_car_service=@car_service
    @cashflow.outflow_spiritual_tools=@spiritual_tools
    @cashflow.outflow_work_lunch=@work_lunch
    @cashflow.outflow_pharmacy=@pharmacy
    @cashflow.outflow_furniture=@furniture
    @cashflow.outflow_other_exp=@other_expenses


    @cashflow.save






  end



  # GET /cashflows/new
  def new
    @cashflow = Cashflow.new

  end

  # GET /cashflows/1/edit
  def edit

  end

  # POST /cashflows
  # POST /cashflows.json
  def create
    @cashflow = Cashflow.new(cashflow_params)

    respond_to do |format|
      if @cashflow.save
        format.html { redirect_to @cashflow, notice: 'Cashflow was successfully created.' }
        format.json { render :show, status: :created, location: @cashflow }
      else
        format.html { render :new }
        format.json { render json: @cashflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cashflows/1
  # PATCH/PUT /cashflows/1.json
  def update
    respond_to do |format|
      if @cashflow.update(cashflow_params)
        format.html { redirect_to @cashflow, notice: 'Cashflow was successfully updated.' }
        format.json { render :show, status: :ok, location: @cashflow }
      else
        format.html { render :edit }
        format.json { render json: @cashflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashflows/1
  # DELETE /cashflows/1.json
  def destroy
    @cashflow.destroy
    respond_to do |format|
      format.html { redirect_to cashflows_url, notice: 'Cashflow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashflow
      @cashflow = Cashflow.find(params[:id])
    end




    # Never trust parameters from the scary internet, only allow the white list through.
    def cashflow_params
      params.require(:cashflow).permit(:month, :year, :accounting_date, :name,:user_id, inflows_attributes:[ :id,:bankaccount_id,:date_posted,:bank_record_date,:monthtitle_id,:yeartitle_id,:inflowtype_id, :person_id,:owner,
      :amount, :details, :flow_type, :user_id,:month,:year ,:_destroy], outflows_attributes:[:id,:date_posted,:bankaccount_id,:bank_record_date,:monthtitle_id,:yeartitle_id,:outflowtype_id,:person_id,:owner,
                                                                               :amount, :details, :flow_type, :user_id,
                                                                                             :month,:year ,:_destroy],
                                       comments_attributes:[:id, :commentary, :user_id, :_destroy])
    end
end
