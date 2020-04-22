class UsersController < ApplicationController

    def show
        @user = current_user  
        if @user.company.name == "Default"
            redirect_to new_company_path      
        end

     
        # @property = current_user.properties.find_by(id: params[:id])   
       # byebug 
    end


    private

    def user_params
        params.require(:id)
    end


end