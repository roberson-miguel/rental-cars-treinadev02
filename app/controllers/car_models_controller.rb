class CarModelsController < ApplicationController
    before_action :authenticate_user! 
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]
    
    def index
        @carmodels = CarModel.all
    end

    def show
        #@carmodel = CarModel.find(params[:id])
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
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
        #@carmodel = CarModel.find(params[:id])
        @manufacturers = Manufacturer.all
        @car_categories = CarCategory.all
    end

    def update
        #@carmodel = CarModel.find(params[:id])
        if @carmodel.update(carmodel_params)
            redirect_to @carmodel
        else 
            render :new 
        end
    end

    def destroy
        #@carmodel = CarModel.find(params[:id])
        @carmodel.destroy
        redirect_to @carmodel, notice: "Modelo excluido com Sucesso"
    end


private
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @carmodel = CarModel.find(params[:id])
    end

    def carmodel_params
       params.require(:car_model).permit(:name, :year, :manufacturer_id, :motorization, :car_category_id, :fuel_type)
    end

end


