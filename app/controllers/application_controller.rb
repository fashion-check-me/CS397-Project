class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def render_401!
    render :file => "public/401", :status => :unauthorized
  end

  def require_admin!
    unless current_user.is_admin?
      render :file => "public/401", :status => :unauthorized
    end
  end
end
