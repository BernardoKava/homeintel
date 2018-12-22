class InflowsController < ApplicationController
  before_action :set_inflow, only: [:show, :edit, :update, :destroy]

  def index

    @search = Inflow.search(params[:q])
    @transactions = @search.result.paginate(page: params[:page], :per_page => 20).order("created_at DESC")


    @total_value = @search.result.sum(:amount)
    @transaction_records = @transactions.total_entries

  end

  def search
    index
    render :index
  end









end
