class ApplicationController < ActionController::Base
  # CSRF対策
  protect_from_forgery with: :exception
  
  # Deviseのパラメータ許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # 会員登録時に許可するパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
    ])
    
    # アカウント更新時に許可するパラメータ
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
    ])
  end
end