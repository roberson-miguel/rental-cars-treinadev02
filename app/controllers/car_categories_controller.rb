class CarCategoriesController < ApplicationController

    before_action :authenticate_user! 
    before_action :authorize_admin
    before_action :set_find, only: [:show, :edit, :update, :destroy]
   
    def index
        @carcategories = CarCategory.all
    end

    def show
        #@carcategory = CarCategory.find(params[:id])
    end

    def new
        @carcategory = CarCategory.new
    end

    def create
        @carcategory = CarCategory.create(category_params)
        redirect_to @carcategory
    end

    def edit
        #@carcategory = CarCategory.find(params[:id])
    end

    def update
        #@carcategory = CarCategory.find(params[:id])
        if @carcategory.update(category_params)
            redirect_to @carcategory
        else 
            render :new 
        end
    end

    def destroy
        #@carcategory = CarCategory.find(params[:id])
        @carcategory.destroy
        redirect_to @carcategory, notice: "Categoria excluida com Sucesso"
    end

private
    def authorize_admin
        unless current_user.admin?
        flash[:alert] = "Voce não tem autorização"
        redirect_to root_path
            
        end
    end

    def set_find
        @carcategory = CarCategory.find(params[:id])
    end

    def category_params
       params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

end


