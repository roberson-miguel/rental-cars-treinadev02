class ManufacturerController < ApplicationController
    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturer = Manufacturer.find(params[:id])
    end
end