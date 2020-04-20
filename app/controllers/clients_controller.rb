class ClientsController < ApplicationController

    def show
        @client = current_user.clients.find_by(id: params[:id])
         if @client.nil? 
            redirect_to current_user, alert: "Client Not Found!"
         else
            @properties = @client.properties & current_user.properties 
         end
    end

   
end
