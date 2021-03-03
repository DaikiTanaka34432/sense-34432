class ApplicationController < ActionController::Base
  # before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # def basic_auth
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:user_check_id, :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :telephone, :office_id, :career, :introduction])
  end
end
