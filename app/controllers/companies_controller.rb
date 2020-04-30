class CompaniesController < ApplicationController

    def new
        redirect_to current_user    
    end

    def create
        current_user[:company_id] = params[:company][:id]
        
            redirect_to current_user if current_user.save
          
        
    end
end
