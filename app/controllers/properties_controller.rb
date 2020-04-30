class PropertiesController < ApplicationController

    def index
        redirect_to user_path(current_user)
        
    end

    def show
       
        if params[:id]
          
            @property = user_properties.find_by(id: params[:id])
    
            @clients = @property.clients & current_user.clients if @property
             
          if @property.nil?
            redirect_to  user_path(current_user), alert: "Property Not Found" 
          end
       end
    
    end

    def cheap_properties
        # byebug
        @budget = budget_params
        @properties = user_properties.cheap_properties(budget_params)
        
    end

    def new
       
        @property = Property.new      
        @statuses = ['Sold', 'New Listing', 'Pending']      
    end

    def create

        @property = current_user.properties.build(property_params)
       
       
        @property[:company_id] = current_user.company.id
        if @property.save
            redirect_to user_property_path(@property.id, @property)
        else
            flash[:notice] = "Property Was Not Saved!"
            redirect_to  new_user_property_path(current_user, @property)
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
        @property[:company_id] = current_user.company.id
    
        if @property.save
            redirect_to user_property_path(@property.id, @property)
        else
          render :edit, alert: "Edit Failed"
        end
      end


    def destroy
        
     @property = user_properties.find_by(id: params[:id])
     if @property && current_user
        @property.destroy
        flash[:notice] = "Property deleted."
        redirect_to user_path(current_user)
     else
        redirect_to  user_path(current_user), alert: "You Do Not Have Permission To Perform That Task"
     end

    end

 private


    def property_params
        
        params.require(:property).permit(:address, :price, :status)
    end

    def user_properties
        current_user.properties
    end

    def budget_params
        params.require(:budget)
        
    end
end
