class CompaniesController < ApplicationController

    def new
        @company = Company.new        
    end

    def create
        @user = current_user
        @user[:company_id] = params[:company][:id]
        if @user.save
            redirect_to @user
        end       
        
    end
end
