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
    end


    def update 
        # byebug
        # u = User.find_by(name: 'David')
        current_user.update(company_id: user_params)
        redirect_to current_user
    end

    private

    def user_params
        params.require(:id)
    end


end