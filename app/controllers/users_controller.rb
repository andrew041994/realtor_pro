class UsersController < ApplicationController
    def index
        if user_signed_in?
            redirect_to user_path(current_user)
        else
            redirect_to root_path
        end
    end

    def show
        @company = Company.new


        

     
        # @property = current_user.properties.find_by(id: params[:id])   
       # byebug 
    end


    private

    def user_params
        params.require(:id)
    end


end