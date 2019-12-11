class CarsController < ApplicationController
    
    before_action :authenticate_user! 
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]

    def index
        @cars = Car.all
    end

    def show
        #@car = Car.find(params[:id])
        @subsidiaries = Subsidiary.all
        @car_models = CarModel.all
    end

    def new
        @car = Car.new
        @subsidiaries = Subsidiary.all
        @car_models = CarModel.all
        
    end

    def create
        @car = Car.new(car_params)
        if @car.save
            flash[:notice] = 'Carro cadastrado com sucesso'
            redirect_to @car
        else
            @subsidiaries = Subsidiary.all
            @car_models = CarModel.all
            flash[:alert] = 'Erro'
            render :new
        end
    end

    def edit
        #@car = Car.find(params[:id])
        @subsidiaries = Subsidiary.all
        @car_models = CarModel.all
    end

    def update
        #@car = Car.find(params[:id])
        @subsidiaries = Subsidiary.all
        @car_models = CarModel.all
        if @car.update(car_params)
            redirect_to @car
        else 
            render :edit
        end
    end

    def destroy
        #@car = Car.find(params[:id])
        @car.destroy
        redirect_to @car, notice: "Carro excluido com Sucesso"
    end

private
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @car = Car.find(params[:id])
    end

    def car_params
       params.require(:car).permit(:licence_plate, :color, :car_model_id, :mileage, :subsidiary_id)
    end

end


