class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  include PublicActivity::StoreController
  
  protected
  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(:username, 
                     :email,
                     :password,
                     :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(:email,
                     :password,
                     :password_confirmation,
                     :current_password,
                     :web,
                     :support,
                     :itch,
                     :name,
                     :twitter)}
    end
end
