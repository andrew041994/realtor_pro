class PropertiesController < ApplicationController

    def show
        if params[:id]
            @property = user_properties.find_by(id:params[:id])       
             if @property.nil?
                redirect_to  user_path(current_user), alert: "Property Not Found" 
             end
        end
    end

    def new
        @property = Property.new         
        @statuses = ['Sold', 'New Listing', 'Pending']      
    end

    def create

        @property = Property.new(property_params)
        @property[:company_id] = current_user.company.id
        if @property.save
            redirect_to @property
        else
            flash[:notice] = "Property Was Not Saved!"
            redirect_to  new_property_path
        end        
    end

    def edit
   
        @property = user_properties.find_by(id:params[:id])
        if @property.nil? 
            redirect_to  user_path(current_user), alert: "Property Not Found"
        end
    end
    

    def destroy
     @property = Property.find(params[:id])
     @property.destroy
     flash[:notice] = "Property deleted."
     redirect_to user_path(current_user)
    end

 private


    def property_params
        
        params.require(:property).permit(:address, :price, :status)
    end

    def user_properties
        current_user.properties
    end
end
