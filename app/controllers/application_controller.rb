class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリー対策
  protect_from_forgery with: :exception

  # before_actionは最初に呼ばれるアクション
  # :configure_permitted_parametersというメソッドはdevice_controllerが呼ばれるときだけ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected


  # Deviceを使っている場合、デフォルトだとメールアドレスとパスだけしかパラメーターを受け取らないからnameカラムを追加する記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end






end
