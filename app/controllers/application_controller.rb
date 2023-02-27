class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_root_path
    else
      customers_my_page_path(params[:id])
    end
  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:encrypted_password,:postal_code,:address,:telephone_number])
    end
end
