class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  # devise用に以下を追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # strong parametersを設定し、nameを許可（belongsも）
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :belongs, :password, :password_confirmation, :admin) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :belongs, :password, :password_confirmation, :admin) }
  end

  def after_sign_in_path_for(resource)
    case resource.belongs
    when 'foc'
      select_date = DateTime.now.strftime('%Y-%m-%d')
      SourceTable.get_table(select_date)
      owners_show_path
    when 'pic'
      users_index_path
    else
      users_index_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    owners_index_path
  end

  def layout_by_resource
    if controller_name == "sessions" && action_name == "new"
      "normal"
    else
      "application"
    end
  end

end