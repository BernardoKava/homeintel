class BudgetsController < ApplicationController
  before_action :set_budget, only: [:show, :edit, :update, :destroy]

  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all.paginate(page: params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /budgets/1
  # GET /budgets/1.json
  def show
    @year= @budget.budget_date.year
    @month= @budget.budget_date.month
    @budget.year= @year
    @budget.month = @month

    @ref = @budget.id
    @totalincome = Income.where(budget_id: @ref).sum(:amount)
    @totalexpense = Expense.where(budget_id: @ref).sum(:amount)

    @incomes = Income.where(budget_id: @ref)
    @expenses = Expense.where(budget_id: @ref)

    @balance = (@totalincome - @totalexpense)
    @budget.balance= @balance



    # Budget number
    @budget_number =  (@budget.id + 10000 )
    @budget.budget_number = @budget_number

    @budget.save


    # Totals income breakdownAmounts

    @salary = @incomes.where(inflowtype_id: 1).sum(:amount)
    @child_benefit = @incomes.where(inflowtype_id: 2).sum(:amount)
    @lotto_winnings = @incomes.where(inflowtype_id: 3).sum(:amount)
    @others = @incomes.where(inflowtype_id: 4).sum(:amount)


    # Totals expense breakdownAmounts

    @rent = @expenses.where(outflowtype_id: 1).sum(:amount)
    @telecom = @expenses.where(outflowtype_id: 2).sum(:amount)
    @eflow = @expenses.where(outflowtype_id: 3).sum(:amount)
    @food = @expenses.where(outflowtype_id: 4).sum(:amount)
    @electricity = @expenses.where(outflowtype_id: 5).sum(:amount)
    @transport = @expenses.where(outflowtype_id: 6).sum(:amount)
    @credit_card_fees = @expenses.where(outflowtype_id: 7).sum(:amount)
    @current_account_fees = @expenses.where(outflowtype_id: 8).sum(:amount)
    @allowance_gaelle = @expenses.where(outflowtype_id: 9).sum(:amount)
    @allowance_herve = @expenses.where(outflowtype_id: 10).sum(:amount)
    @loan_ptsb = @expenses.where(outflowtype_id: 11).sum(:amount)
    @loan_chill_money = @expenses.where(outflowtype_id: 12).sum(:amount)
    @lodgement_credit_union = @expenses.where(outflowtype_id: 13).sum(:amount)
    @family_support = @expenses.where(outflowtype_id: 14).sum(:amount)
    @entertainment_nightout = @expenses.where(outflowtype_id: 15).sum(:amount)
    @entertainment_dayout = @expenses.where(outflowtype_id: 16).sum(:amount)
    @apple_storage = @expenses.where(outflowtype_id: 17).sum(:amount)
    @aa_ireland = @expenses.where(outflowtype_id: 18).sum(:amount)
    @lottery_ticket = @expenses.where(outflowtype_id: 19).sum(:amount)
    @car_tax = @expenses.where(outflowtype_id: 20).sum(:amount)
    @heating_oil = @expenses.where(outflowtype_id: 21).sum(:amount)
    @car_service = @expenses.where(outflowtype_id: 22).sum(:amount)
    @spiritual_tools = @expenses.where(outflowtype_id: 23).sum(:amount)
    @other_expenses = @expenses.where(outflowtype_id: 24).sum(:amount)

  end


  # GET /budgets/new
  def new
    @budget = Budget.new

  end

  # GET /budgets/1/edit
  def edit

  end

  # POST /budgets
  # POST /budgets.json
  def create
    @budget = Budget.new(budget_params)

    respond_to do |format|
      if @budget.save
        format.html { redirect_to @budget, notice: 'Budget was successfully created.' }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgets/1
  # PATCH/PUT /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to @budget, notice: 'Budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1
  # DELETE /budgets/1.json
  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url, notice: 'Budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:user_id, :month, :year, :budget_date, :name,
                                     incomes_attributes:[:id,:monthtitle_id,:yeartitle_id,
                                                         :person_id,
                                                         :inflowtype_id,:owner,:amount,:user_id,:details,:income_type,
                                                         :month,:year,:_destroy],
      expenses_attributes:[:id,:monthtitle_id,:yeartitle_id, :outflowtype_id,:person_id,:owner, :amount, :user_id,
                           :details,:expense_type,:month,:year ,:_destroy],
                                     comments_attributes:[:id,:user_id, :commentary,:_destroy])
    end
end
