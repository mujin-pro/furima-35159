class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :encrypted_password, :password_confirmation, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birth_day] )
  end
end
