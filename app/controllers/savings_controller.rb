class SavingsController < ApplicationController
  before_action :set_saving, only: [:show, :edit, :update, :destroy]

  # GET /savings
  # GET /savings.json
  def index
    @savings = Saving.all.paginate(page: params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /savings/1
  # GET /savings/1.json
  def show
    @year= @saving.saving_date.year
    @month= @saving.saving_date.month
    @saving.year= @year
    @saving.month = @month

    @ref = @saving.id
    @totallodgement = Lodgement.where(saving_id: @ref).sum(:amount)
    @totalwithdrawal = Withdrawal.where(saving_id: @ref).sum(:amount)
    @lodgments = Lodgement.where(saving_id: @ref)
    @withdrawals = Withdrawal.where(saving_id: @ref)



    @balance = (@totallodgement - @totalwithdrawal)
    @saving.balance= @balance

    # Savings number
    @saving_number =  (@saving.id + 10000 )
    @saving.saving_number = @saving_number


    @saving.save



  end

  # GET /savings/new
  def new
    @saving = Saving.new


  end

  # GET /savings/1/edit
  def edit

  end

  # POST /savings
  # POST /savings.json
  def create
    @saving = Saving.new(saving_params)

    respond_to do |format|
      if @saving.save
        format.html { redirect_to @saving, notice: 'Saving was successfully created.' }
        format.json { render :show, status: :created, location: @saving }
      else
        format.html { render :new }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savings/1
  # PATCH/PUT /savings/1.json
  def update
    respond_to do |format|
      if @saving.update(saving_params)
        format.html { redirect_to @saving, notice: 'Saving was successfully updated.' }
        format.json { render :show, status: :ok, location: @saving }
      else
        format.html { render :edit }
        format.json { render json: @saving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savings/1
  # DELETE /savings/1.json
  def destroy
    @saving.destroy
    respond_to do |format|
      format.html { redirect_to savings_url, notice: 'Saving was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saving
      @saving = Saving.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saving_params
      params.require(:saving).permit(:user_id, :month, :year, :saving_date, :name, lodgements_attributes:
          [:id,:yeartitle_id,:monthtitle_id,:person_id,:financialinstitution_id,:owner,:amount, :details,:user_id,:institution,:month,:year ,:_destroy],
                                     withdrawals_attributes: [:id,:yeartitle_id,:monthtitle_id,:person_id,:financialinstitution_id,:owner,:amount, :details,:user_id,:institution,:month,:year ,:_destroy],
                                     comments_attributes:[:id, :user_id,:commentary, :_destroy])
    end
end