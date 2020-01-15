class DashboardController < ApplicationController

  def index
    if current_user.present?
      redirect_to calls_path
    else
      redirect_to new_user_session_path
    end
  end

end
