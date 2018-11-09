class WithdrawalsController < ApplicationController
  def index

    @search = Withdrawal.search(params[:q])
    @transactions = @search.result.paginate(page: params[:page], :per_page => 20).order("created_at DESC")



    @total_value = @search.result.sum(:amount)
    @transaction_records = @transactions.total_entries

  end

  def search
    index
    render :index
  end

end
