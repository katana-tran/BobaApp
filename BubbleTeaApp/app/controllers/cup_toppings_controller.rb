class CupToppingsController < ApplicationController
    def index
        @cup_tops = CupTopping.all
        byebug
    end
end
