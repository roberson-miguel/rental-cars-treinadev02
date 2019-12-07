class CarCategoriesController < ApplicationController

    #before_action :authenticate_user!, only: [:new]
    before_action :authenticate_user! do
        redirect_to new_user_session_path unless current_user.admin!
    end
   
    def index
        @carcategories = CarCategory.all
    end

    def show
        @carcategory = CarCategory.find(params[:id])
    end

    def new
        @carcategory = CarCategory.new
    end

    def create
        @carcategory = CarCategory.create(category_params)
        redirect_to @carcategory
    end

    def edit
        @carcategory = CarCategory.find(params[:id])
    end

    def update
        @carcategory = CarCategory.find(params[:id])
        if @carcategory.update(category_params)
            redirect_to @carcategory
        else 
            render :new 
        end
    end

    def destroy
        @carcategory = CarCategory.find(params[:id])
        @carcategory.destroy
        redirect_to @carcategory, notice: "Categoria excluida com Sucesso"
    end

private

    def category_params
       params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end

end


