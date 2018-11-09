class LegacyUlsterbanksController < ApplicationController
  def index

    # search form ulsterbank ancient transactions
    @search = LegacyUlsterbank.search(params[:q])
    @transactions = @search.result.paginate(page: params[:page], :per_page => 20).order("created_at DESC")

    @total_value = @search.result.sum(:trans_value)
    @transaction_records = @transactions.total_entries

  end

  def search
    index
    render :index
  end

end
