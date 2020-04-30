class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
       user_path(current_user)
     end

     def not_found
      flash[:notice] = "Page Not Found"
      redirect_to root_path
    end

    protected

    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :company_id, :password)}

         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :company_id, :password)}
    end

end
 

