class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  # devise用に以下を追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # strong parametersを設定し、nameを許可（belongsも）
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :belongs, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :belongs, :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
    case resource.belongs
    when 'foc'
      owners_show_path
    when 'pic'
      users_index_path
    else
      users_index_path
    end
  end

  # def after_sign_out_path_for(resource)
  #   admin_root_path
  # end

end
