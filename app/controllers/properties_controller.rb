class PropertiesController < ApplicationController

    def show
       
        if params[:id]
          
            @property = user_properties.find_by(id: params[:id])
            #byebug
            @clients = @property.clients & current_user.clients 
             
          if @property.nil?
            redirect_to  user_path(current_user), alert: "Property Not Found" 
          end
       end
    
    end

    def cheap_properties
        @properties = current_user.properties.cheap_properties
        
    end

    def new
        @user = User.find_by(id: params[:user_id])
        @property = Property.new #(user_id: params[:user_id])       
        @statuses = ['Sold', 'New Listing', 'Pending']      
    end

    def create

        @property = Property.new(property_params)
        #@property[:user_id] = params[:user_id]
        @property[:company_id] = current_user.company.id
        if @property.save
            redirect_to user_property_path(@property.id, @property)
        else
            flash[:notice] = "Property Was Not Saved!"
            redirect_to  new_user_property_path(@property.user_id, @property)
        end        
    end

    def edit
        @user = User.find_by(id: params[:user_id])
        @property = user_properties.find_by(id: params[:id])
        if @property.nil? 
            redirect_to  user_path(current_user), alert: "Property Not Found"
        end
    end

    def update
        @property = user_properties.find_by(id:params[:id])
    
        @property.update(property_params)
        #@property[:user_id] = params[:user_id]
        @property[:company_id] = current_user.company.id
    
        if @property.save
            redirect_to user_property_path(@property.id, @property)
        else
          render :edit, alert: "Edit Failed"
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
