class ApplicationController < ActionController::Base
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  def authenticate_admin_user!
    authenticate_user!
    unless current_user.is_admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
  
end
