class RentalsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :search]
    before_action :set_find, only: [:show, :edit, :update, :destroy]
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
        @rentals = Rental.all
    end

    def show
        @clients = Client.all
        @users = User.all
        @car_categories = CarCategory.all
        @subsidiaries = Subsidiary.all
    end

    def new
        @rental = Rental.new
        @clients = Client.all
        @users = User.all
        @subsidiaries = Subsidiary.all
        @car_categories = CarCategory.all
    end

    def create
        @rental = Rental.new(rental_params)
        if @rental.save
            flash[:notice] = 'Locação cadastrada com sucesso'
            redirect_to @rental
        else
            @clients = Client.all
            @users = User.all
            @car_categories = CarCategory.all
            @subsidiaries = Subsidiary.all
            flash[:alert] = 'Erro'
            render :new
        end
    end

    def edit
        @clients = Client.all
        @subsidiaries = Subsidiary.all
        @users = User.all
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
        @clients = Client.all
        @users = User.all
        @car_categories = CarCategory.all
        @subsidiaries = Subsidiary.all
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
       params.require(:rental).permit(:start_date, :end_date, :client_id, 
                                      :car_category_id, :status_rental, 
                                      :reservation_code, :subsidiary_id, :user_id)
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password])
    end 

end


