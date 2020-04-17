class PropertiesController < ApplicationController

    def show
        @property = Property.find_by(id:params[:id])
        
    end
end
