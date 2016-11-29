class TowersController < ApplicationController
    def index
        @towers = Tower.all()
    end

    def new
        @tower = Tower.new
    end

    def create
        @tower = Tower.new(tower_params)
        @tower.name = tower_params['name'].strip.downcase

        if @tower.save!
            flash[:success] = "Tower added!"
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
            flash[:success] = "Tower edited!"
            redirect_to towers_path
        else
            flash[:error] = "Error!"
            redirect_to towers_path
        end
    end

    def edit
        @tower = Tower.find(params[:id])
    end

    def destroy
        Tower.find(params[:id]).destroy
        flash[:success] = "Tower deleted!"
        redirect_to towers_path
    end

    private
    def tower_params
        params.require(:tower).permit(:name)
    end

end
