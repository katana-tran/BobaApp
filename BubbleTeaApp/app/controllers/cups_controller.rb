class CupsController < ApplicationController
<<<<<<< HEAD
    def index
    end
=======
    before_action :set_params, only: [:create, :update]
    before_action :find_instance, only: [:show, :edit]
    before_action :all_toppings, only: [:index, :show]

    def index
        @cup= Cup.new
        # @cups = Cup.all
        # byebug
    end
    
    def new
        @cup = Cup.new
    end

    def create
        @cup = Cup.new(set_params)
        @cup.save
        @amount= set_params(:amount)
        redirect_to cup_path(Cup.first)
    end

    def show
        find_instance
    end

    def edit
        find_instance
    end

    def size
    end
    
    def update
        @cup=Cup.first.update(set_params)
        redirect_to cup_path(Cup.first)
    end


    private

    def set_params
        params.require(:cup).permit(:straw_id, :tea_id, :user_id, :name, :amount, :size)

    end

    def find_instance
        @cup= Cup.first
    end


    def all_toppings
        @all_cups= CupTopping.select do |cuptop|
            cuptop.cup_id == Cup.first.id
        end

        @all_topping= @all_cups.collect do |cups|
            cups.topping
        end

        @all_names= @all_topping.collect do |top|
            top.name
        end
    end

>>>>>>> 57b63c1614765f42007e2a4ce0c97d5299938d0c
end
