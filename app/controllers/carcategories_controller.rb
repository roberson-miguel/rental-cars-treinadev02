class CarcategoriesController < ApplicationController
    def index
        @carcategories = CarCategory.all
    end

    def show
        @carcategory = CarCategory.find(params[:id])
    end
end