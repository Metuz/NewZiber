class ApplicationController < ActionController::Base
  before_filter :set_page
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  def set_page
    @page = Page.first
  end


  protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :location_id, :clientname, :address, :phone) }
   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :location_id, :admin, :manager, :technician, :receptionist, :clientname, :address, :phone) }
 end
end
