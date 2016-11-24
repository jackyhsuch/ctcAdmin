class TowersController < ApplicationController
    def index
        @towers = Tower.all()
    end
end
