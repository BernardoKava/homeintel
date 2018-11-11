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
    @inflows = Inflow.where(cashflow_id: @ref)
    @outflows = Outflow.where(cashflow_id: @ref)
    # balance calculation
    @i = 0
    @balance = ((@totalinflow - @saving_lodgement)- @totaloutflow) + @cash_injection
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
      params.require(:cashflow).permit(:month, :year, :accounting_date, :name,:user_id, inflows_attributes:[ :id,:date_posted,:bank_record_date,:monthtitle_id,:yeartitle_id,:inflowtype_id, :person_id,:owner,
      :amount, :details, :flow_type, :user_id,:month,:year ,:_destroy], outflows_attributes:[:id,:date_posted,:bank_record_date,:monthtitle_id,:yeartitle_id,:outflowtype_id,:person_id,:owner,
                                                                               :amount, :details, :flow_type, :user_id,
                                                                                             :month,:year ,:_destroy],
                                       comments_attributes:[:id, :commentary, :user_id, :_destroy])
    end
end
