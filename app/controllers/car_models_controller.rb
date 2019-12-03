class CarModelsController < ApplicationController
    def index
        @carmodels = CarModel.all
    end

    def show
        @carmodel = CarModel.find(params[:id])
    end

    def new
        @carmodel = CarModel.new
    end

    def create
        @carmodel = CarModel.create(carmodel_params)
        redirect_to @carmodel
    end

    def edit
        @carmodel = CarModel.find(params[:id])
    end

    def update
        @carmodel = CarModel.find(params[:id])
        if @carmodel.update(carmodel_params)
            redirect_to @carmodel
        else 
            render :new 
        end
    end


private

    def carmodel_params
       params.require(:car_model).permit(:name, :year, :Manufacturer, :motorization, :CarCategory, :fuel_type)
    end

end


