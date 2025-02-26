class SubsidiariesController < ApplicationController

    before_action :authenticate_user!, only: [:destroy, :search]
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]
    
    def index
        @subsidiaries = Subsidiary.all
    end

    def show
        #@subsidiary = Subsidiary.find(params[:id])
    end

    def new
        @subsidiary = Subsidiary.new
    end

    def create
        @subsidiary = Subsidiary.new(subsidiary_params)
        if @subsidiary.save
           redirect_to @subsidiary
        else
            flash.now[:alert] = 'Você deve informar todos os campos'
            render :new
        end
    end

    def edit
        #@subsidiary = Subsidiary.find(params[:id]) 
    end


    def update
        #@subsidiary = Subsidiary.find(params[:id])
        if @subsidiary.update(subsidiary_params)
            redirect_to @subsidiary
            flash[:notice] = "Filial alterada com sucesso"
        else 
            flash.now[:alert] = 'Nome ou CNPJ já está em uso'
            render :edit 
        end
    end

    def destroy
        #@subsidiary = Subsidiary.find(params[:id])
        @subsidiary.destroy
        redirect_to @subsidiary, notice: "Filial excluida com Sucesso"
    end


private

    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @subsidiary = Subsidiary.find(params[:id])
    end

    def subsidiary_params
        params.require(:subsidiary).permit(:name, :cnpj, :address)
    end


end
