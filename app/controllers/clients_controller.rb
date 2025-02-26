class ClientsController < ApplicationController
    before_action :authenticate_user! 
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]
  
    def index
       @clients = Client.all
    end

    def show
        #@client = Client.find(params[:id])
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client
        else
            #flash.now[:alert] = 'Você deve informar todos os campos'
            render :new
        end
    end

    def edit
        @client = Client.find(params[:id])
    end

    def update
        #@client = Client.find(params[:id])
        if @client.update(client_params)
            redirect_to @client
            flash[:notice] = "Cliente alterado com sucesso"
        else 
            #flash.now[:alert] = 'CPF ou Email já está em uso'
            render :edit 
        end
    end
    
    def destroy
        #@client = Client.find(params[:id])
        @client.destroy
        redirect_to @client, notice: "Cliente excluido com Sucesso"
    end

private
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @client= Client.find(params[:id])
    end

    def client_params
        params.require(:client).permit(:name, :document, :email)
    end

end