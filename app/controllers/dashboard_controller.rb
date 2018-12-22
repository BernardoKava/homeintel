class DashboardController < ApplicationController

  def index
    @budgets     =  Budget.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @cashflows   =  Cashflow.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @savings     =  Saving.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @ledgers     =  Ledger.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @deliveries  =  Delivery.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @inventories =  Inventory.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")
    @people      =  Person.all.paginate(page: params[:page], :per_page => 4).order("created_at DESC")

    @inflow_fu_count    = Inflow.where(follow_up: true).count
    @outflow_fu_count   = Outflow.where(follow_up: true).count

  end



  def financial

  end


  def pendingaccess

  end
end
