class UsersController < ApplicationController

    def show
        @user = current_user   
     
        # @property = current_user.properties.find_by(id: params[:id])   
       # byebug 
    end


    private

    def user_params
        params.require(:id)
    end


end