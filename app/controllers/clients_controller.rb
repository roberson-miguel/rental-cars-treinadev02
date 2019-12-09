class ClientsController < ApplicationController

    before_action :authenticate_user! do
        redirect_to new_user_session_path unless current_user.admin!
    end
    
    def index
       @clients = Client.all
    end

    def show
        @client = Client.find(params[:id])
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
        @client = Client.find(params[:id])
        if @client.update(client_params)
            redirect_to @client
            flash[:notice] = "Cliente alterado com sucesso"
        else 
            #flash.now[:alert] = 'CPF ou Email já está em uso'
            render :edit 
        end
    end
    
    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to @client, notice: "Cliente excluido com Sucesso"
    end

private

    def client_params
        params.require(:client).permit(:name, :document, :email)
    end

end