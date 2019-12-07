class RentalsController < ApplicationController
    
    #before_action :authenticate_user!, only: [:new]

    def index
        @rentals = Rental.all
    end

    def show
        @rental = Rental.find(params[:id])
        @clients = Client.all
        @car_categories = CarCategory.all
    end

    def new
        @rental = Rental.new
        @clients = Client.all
        @car_categories = CarCategory.all
    end

    def create
        @rental = Rental.new(rental_params)
        if @rental.save
            flash[:notice] = 'Locação cadastrada com sucesso'
            redirect_to @rental
        else
            @clients = Client.all
            @car_categories = CarCategory.all
            flash[:alert] = 'Erro'
            render :new
        end
    end

    def edit
        @rental = Rental.find(params[:id])
        @clients = Client.all
        @car_categories = CarCategory.all
    end

    def update
        @rental = Rental.find(params[:id])
        if @rental.update(rental_params)
            redirect_to @rental
        else 
            render :edit
        end
    end

    def destroy
        @rental = Rental.find(params[:id])
        @rental.destroy
        redirect_to @rental, notice: "Locação excluida com Sucesso"
    end

private

    def rental_params
       params.require(:rental).permit(:start_date, :end_date, :client_id, :car_category_id)
    end

end


