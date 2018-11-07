class DashboardController < ApplicationController

  def index
    @budgets     =  Budget.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @cashflows   =  Cashflow.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @savings     =  Saving.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @ledgers     =  Ledger.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @deliveries  =  Delivery.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @inventories =  Inventory.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @people      =  Person.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")

  end

  def financial
    @budgets     =  Budget.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @cashflows   =  Cashflow.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @savings     =  Saving.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @ledgers     =  Ledger.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")

    @inflows     =  Inflow.all
    @ouflows     =  Outflow.all

  end

  def passwords
    @passwords = Passwordrepository.where(:active => true).paginate(page: params[:page], :per_page => 4).order("created_at DESC")
  end

  def legacy

    @ulster_bank_transactions = if params[:term]
                                  LegacyUlsterbank.where('description LIKE?', "%#{params[:term]}%")
                                      .paginate(page: params[:page], :per_page => 10).order("created_at DESC")
                                else
                                  LegacyUlsterbank.all.paginate(page: params[:page], :per_page => 10).order("created_at DESC")
                                end
    @total = @ulster_bank_transactions.sum(:trans_value)
    @records = @ulster_bank_transactions.total_entries


  end


  def task_params
    params.require(:dashboard).permit(:term)

  end






end
