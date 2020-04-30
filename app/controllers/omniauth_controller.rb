class OmniauthController < ApplicationController

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
          if @user.persisted?
            sign_in_and_redirect @user       
          else
            flash[:error] = "Sign in unsuccessful"  
            redirect_to new_user_registration_path
          end
    end

    def failure
        flash[:error] = "Sign in unsuccessful"  
            redirect_to new_user_registration_path
    end


end
