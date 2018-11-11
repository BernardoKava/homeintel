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


  def passwords
    @passwords = Passwordrepository.where(:active => true).paginate(page: params[:page], :per_page => 4).order("created_at DESC")
  end

  def financial

  end


end
