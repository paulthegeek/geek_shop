class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authenticate_permissions!
    if current_user.nil? || current_user.customer?
      redirect_to root_path, notice: t("application.notice")
    end
  end
end
