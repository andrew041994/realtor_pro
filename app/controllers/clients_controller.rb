class ClientsController < ApplicationController

    def show
        @client = current_user.clients.find_by(id: params[:id])
         if @client.nil? 
            redirect_to current_user, alert: "Client Not Found!"
         else
            @properties = @client.properties & current_user.properties 
         end
    end

    def new
      @client = Client.new
      @property = current_user.properties.find_by(id:params[:property_id])
       
    end

    def create
      @property = current_user.properties.find_by(id:params[:property_id])
      @client = Client.new(client_params)

      if @client.save

         @property.clients << @client
         current_user.clients << @client
         redirect_to user_property_path(current_user, @property)
      else
         flash[:notice] = "Client Was not Saved!"
         redirect_to new_user_property_client_path
        
      end
   end


   private

   def client_params
      params.require(:client).permit(:name, :email)
      
   end
end
