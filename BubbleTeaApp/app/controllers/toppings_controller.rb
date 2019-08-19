class ToppingsController < ApplicationController
    before_action :get_topping, only: [:show, :edit, :update, :delete]
    def index
        @toppings = Topping.all
    end
    
    def new
        @topping = Topping.new
    end

    def show
    end

    def create
        @topping = Topping.new(topping_params)
        @topping.save
    end

    def edit
    end

    def update
    end

    def delete
    end

    private
    def get_topping
        @topping = Topping.find(params[:id])
    end

    def topping_params 
        params.require(:topping).permit(:name,:img_url)
    end
end
