class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username])
  end
end
