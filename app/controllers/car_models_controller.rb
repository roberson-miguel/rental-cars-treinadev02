class CarModelsController < ApplicationController
    def index
        @carmodels = CarModel.all
    end

    def show
        @carmodel = CarModel.find(params[:id])
    end

    def new
        @carmodel = CarModel.new
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
    end

    def create
        @carmodel = CarModel.new(carmodel_params)
        if @carmodel.save
            flash[:notice] = "Modelo cadastrado com sucesso"
            redirect_to @carmodel
        else
            @manufacturers = Manufacturer.all
            @car_categories = CarCategory.all
            flash[:alert] = 'Erro'
            render :new
        end
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

    def destroy
        @carmodel = CarModel.find(params[:id])
        @carmodel.destroy
        redirect_to @carmodel, notice: "Modelo excluido com Sucesso"
    end


private

    def carmodel_params
       params.require(:car_model).permit(:name, :year, :manufacturer_id, :motorization, :car_category_id, :fuel_type)
    end

end


