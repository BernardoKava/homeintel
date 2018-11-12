class PasswordrepositoriesController < ApplicationController

  def index
    @search = Passwordrepository.search(params[:q])
    @passwords = @search.result(disctinct: true).where(active: true).paginate(page: params[:page], :per_page => 10).order("created_at DESC")

    @password_records = @passwords.total_entries
  end

  def search
    index
    render :index
  end


end
