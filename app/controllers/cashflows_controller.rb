class CashflowsController < ApplicationController
  before_action :set_cashflow, only: [:show, :edit, :update, :destroy]

  # GET /cashflows
  # GET /cashflows.json
  def index
    @cashflows = Cashflow.all
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

    #save whatever can be saved on the table
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
      params.require(:cashflow).permit(:month, :year, :accounting_date, :name,:user_id, inflows_attributes:[ :id,:monthtitle_id,:yeartitle_id,:inflowtype_id, :person_id,:owner,
      :amount, :details, :flow_type, :user_id,:month,:year ,:_destroy], outflows_attributes:[:id,:monthtitle_id,:yeartitle_id,:outflowtype_id,:person_id,:owner,
                                                                               :amount, :details, :flow_type, :user_id,
                                                                                             :month,:year ,:_destroy],
                                       comments_attributes:[:id, :commentary, :user_id, :_destroy])
    end
end
