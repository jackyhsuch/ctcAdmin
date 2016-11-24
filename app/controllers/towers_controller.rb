class TowersController < ApplicationController
    def index
        @towers = Tower.all()
    end

    def new
    end


    def create
        @tower = Tower.new(tower_params)
        @tower.name = tower_params['name'].strip.capitalize

        if @tower.save!
            flash[:success] = "New tower added successfully!"
            redirect_to towers_path
        else
            render 'new'
        end
    end

    private
    def tower_params
        params.require(:tower).permit(:name)
    end

end
