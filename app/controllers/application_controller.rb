class ApplicationController < ActionController::Base
  #  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :email, :birth_day, :first_name, :last_name, :first_name_kana, :last_name_kana]
    )
  end
end
  before_action :basic_auth
  (省略)

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
