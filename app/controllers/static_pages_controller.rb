class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to dashboard_index_url
    end


  end

  def help
  end
end
