class CupsController < ApplicationController
    # before_action :set_params, only: [:create, :update]
    # before_action :find_instance, only: :edit
    before_action :redirected_user
    # before_action :all_toppings, only: [:index, :show]

    def index
        if signed_in?
            @cups = Cup.all.select do |cup|
            cup.user_id == session[:user_id]
            end
        else
            redirect_to signin_path
        end
    end
    
    def new
        @cup = Cup.new
    end

    def create
        params[:cup][:topping_ids] = params[:topping_ids].map do |topping|
            topping.to_i
        end
        params[:cup][:user_id] = session[:user_id]
        @cup = Cup.new(set_params)
        @cup.save
        # @amount = set_params(:amount)
        # byebug
        redirect_to cup_path(@cup)
    end

    def show
        @cup = Cup.find(params[:id])
        if @cup.user_id == session[:user_id]
            @toppings = @cup.toppings
        else 
            flash[:error_message] = "You do not have view access to that cup."
            redirect_to cups_path
        end
    end

    def edit
        @cup = Cup.find(params[:id])
        if @cup.user_id != session[:user_id]
            flash[:error_message] = "You do not have edit access to that cup."
            redirect_to cups_path
        end
    end
    
    def update
        @cup = Cup.find_by(params[:id])
        @cup.update(set_params)
        redirect_to cup_path(@cup)
    end

    def destroy
        @cup = Cup.find(params[:id])
        if @cup.user_id != session[:user_id]
            flash[:error_message] = "You do not have edit access to that cup."
        else
            @cup.delete
        redirect_to cups_path
    end

    private

    def set_params
        params.require(:cup).permit(:straw_id, :tea_id, :user_id, :name, :amount, :size, topping_ids: [])

    end

    # def tea_url
    #     @tea_url= find_instance.name
    # end


    def find_instance
        @cup= Cup.first
    end


    # def all_toppings
    #     @all_cups= CupTopping.select do |cuptop|
    #         cuptop.cup_id == Cup.first.id
    #     end

    #     @all_topping= @all_cups.collect do |cups|
    #         cups.topping
    #     end

    #     @all_names= @all_topping.collect do |top|
    #         top.name
    #     end
    # end

end
