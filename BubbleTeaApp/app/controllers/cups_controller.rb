class CupsController < ApplicationController
    def index
        @cup = Cup.new
        # @cups = Cup.all
        byebug
    end
    
    def new
        @cup = Cup.new
    end

    def show
    end


end
