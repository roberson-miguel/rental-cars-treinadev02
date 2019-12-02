class ManufacturersController < ApplicationController
    def index
        @manufacturers = Manufacturer.all
    end

    def show
        @manufacturer = Manufacturer.find(params[:id])
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
        @manufacturer = Manufacturer.find(params[:id])
    end

    def update
        @manufacturer = Manufacturer.find(params[:id])
        if @manufacturer.update(manufacturer_params)
            redirect_to @manufacturer
            flash[:notice] = "Fabricante alterado com sucesso"
        else 
            flash.now[:alert] = 'Nome já está em uso'
            render :edit 
        end
    end

private

    def manufacturer_params
        params.require(:manufacturer).permit(:name)
    end

end