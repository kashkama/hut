class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def must_login?
      if !user_signed_in?
        flash[:alert]= "you must be logged"
        redirect_to new_user_session_path
      end
  end
  def admin_controller?
    !devise_controller? and request.path =~ /^\/admin/
  end
  helper_method :admin_controller?

  protected

    def configure_permitted_parameters
      added_attrs = [:name, :email, :password, :password_confirmation, :avatar, :telephone, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
