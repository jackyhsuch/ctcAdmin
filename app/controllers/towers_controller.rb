class TowersController < ApplicationController
    def index
        @towers = Tower.all()
    end

    def new
    end


    def create
        @tower = Tower.new(tower_params)
        @tower.name = tower_params['name'].strip.downcase

        if @tower.save!
            flash[:success] = "New tower added successfully!"
            redirect_to towers_path
        else
            render 'new'
        end
    end

    def show
        @tower = Tower.find(params['id'])
    end

    def update
        tower = Tower.find(params['id'])
        tower.name = tower_params['name']

        if tower.save!
            flash[:success] = "Edited successfully!"
            redirect_to towers_path
        else
            flash[:error] = "Error!"
            redirect_to towers_path
        end
    end

    def delete
        tower = Tower.find(params['tower_id'])
        tower.destroy

        redirect_to towers_path
    end

    private
    def tower_params
        params.require(:tower).permit(:name)
    end

end
