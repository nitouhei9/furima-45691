class ApplicationController < ActionController::Base
  # Basic認証
  before_action :basic_auth
  
  # CSRF対策
  protect_from_forgery with: :exception
  
  # Deviseのパラメータ許可
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end


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