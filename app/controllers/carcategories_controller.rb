class CarcategoriesController < ApplicationController
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
        @carcategory = CarCategory.create(carcategory_params)
        redirect_to @carcategory
    end

    def edit
        @carcategory= CarCategory.find(params[:id])
    end

    def update
        @carcategory = CarCategory.find(params[:id])
        if @carcategory.update(carcategory_params)
            redirect_to @carcategory
        else 
            render new 
        end
    end

private

    def carcategory_params
        params.require(:carcategory).permit(:name, :daily_rate, :car_insurance, :third_party_insurance)
    end
end
