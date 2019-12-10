class ManufacturersController < ApplicationController

    before_action :authenticate_user! 
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]
    
    def index
        @manufacturers = Manufacturer.all
    end

    def show
        #@manufacturer = Manufacturer.find(params[:id])
    end

    def new
        @manufacturer = Manufacturer.new
    end

    def create
        @manufacturer = Manufacturer.new(manufacturer_params)
        if @manufacturer.save
            redirect_to @manufacturer
        else
            flash.now[:alert] = 'Você deve informar o nome do fabricante'
            render :new
        end
    end

    def edit
        #@manufacturer = Manufacturer.find(params[:id])
    end

    def update
        #@manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.update(manufacturer_params)
            redirect_to @manufacturer
            flash[:notice] = "Fabricante alterado com sucesso"
        else 
            flash.now[:alert] = 'Nome já está em uso'
            render :edit 
        end
    end

    def destroy
        #@manufacturer = Manufacturer.find(params[:id])
        @manufacturer.destroy
        redirect_to @manufacturer, notice: "Fabricante excluido com Sucesso"
    end

private
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @manufacturer= Manufacturer.find(params[:id])
    end

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

end