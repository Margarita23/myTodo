class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  check_authorization :unless => :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.new_user_session_path, alert: exception.message
  end
end
