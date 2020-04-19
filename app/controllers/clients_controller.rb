class ClientsController < ApplicationController

    def show
        @client = current_user.clients.find_by(id: params[:id])
        #byebug
        @properties = @client.properties.where(company_id: current_user.company.id)
       # byebug
       
    
        
    end
end
