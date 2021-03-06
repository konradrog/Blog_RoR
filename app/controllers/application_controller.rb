class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_admin

  private

  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find(session[:admin_id])
    else
      nil
    end
  end

  def authenticate_admin
    unless current_admin
      flash[:alert] = "Go home, you're drunk"
      redirect_to "/"
    end
  end
end
