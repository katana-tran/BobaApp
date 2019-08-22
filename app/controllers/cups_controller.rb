class CupsController < ApplicationController
    # before_action :set_params, only: [:create, :update]
    # before_action :find_instance, only: :edit
    # before_action :all_toppings, only: [:index, :show]

    def index
        @cups = Cup.all
        # @cups = Cup.all
        # byebug
    end
    
    def new
        @cup = Cup.new
    end

    def create
        cup = params[:topping_ids].map do |topping|
            topping.to_i
        end
        params[:cup][:topping_ids] = cup.reverse
        

        @cup = Cup.new(set_params)
       
        @cup.save


        #we are geting the amount of toppings instances just put into the cup
        length = params[:cup][:topping_ids].length
        x = length
        # XY = x
        #for amount of topping instances that are put in, we need to multiple by the amount that was given to us
        amount = params[:amount] 
        counter = 0
        y = 0
        # binding.pry
        while counter <= length
        a = amount[y].to_i
        temp = []
        (a-1).times do
            # byebug
            instance = Topping.all.find(Cup.last.topping_ids[x-1])
            
            temp << instance
            #instance of topping
                
        end
        x +=1
        y += 1
        counter += 1

        final= Cup.last.toppings << temp
        end
        redirect_to cup_path(@cup)

        # x = params[:cup][:topping_ids].length
        # x.times do
        #     CupTopping.all[-x].amount = Cup.last.topping_ids[-x]
        #     x = x-1

          
        # end
        # byebug

    end

    def show
        @cup = Cup.find(params[:id])
        @toppings = @cup.toppings
    end

    def edit
    end
    
    def update
        @cup=Cup.find_by(params[:id])
        @cup.update(set_params)
        redirect_to cup_path(@cup)
    end


    private

    def set_params
        params.require(:cup).permit(:straw_id, :tea_id, :user_id, :name, :amount, :size, topping_ids: [])

    end

    # def tea_url
    #     @tea_url= find_instance.name
    # end

    #for purposes of associating amount to topping



    def find_instance
        @cup= Cup.first
    end

    # def rand_quote
    #     Quote.rand_quote
    # end



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


# def example
#     thing = Thing.create(some crap)

#     thing.id