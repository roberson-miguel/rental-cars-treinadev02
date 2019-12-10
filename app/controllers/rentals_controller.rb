class RentalsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_find, only: [:show, :edit, :update, :destroy]

    def index
        @rentals = Rental.all
    end

    def show
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
        @clients = Client.all
        @car_categories = CarCategory.all
    end

    def update
        if @rental.update(rental_params)
            redirect_to @rental
        else 
            render :edit
        end
    end

    def destroy
        @rental.destroy
        redirect_to @rental, notice: "Locação excluida com Sucesso"
    end

    def search
        if params[:search]
            @rentals = Rental.search(params[:search])  
        else
            @rentals = Rental.all
        end      
    end


private
        
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @rental = Rental.find(params[:id])
    end

    def rental_params
       params.require(:rental).permit(:start_date, :end_date, :client_id, :car_category_id, :status_rental, :reservation_code)
    end

end


