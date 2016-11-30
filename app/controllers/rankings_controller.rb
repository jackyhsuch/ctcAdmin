class RankingsController < ApplicationController
    def index
        @towers = Tower.all().order(id: :asc)
    end

    def show
        @tower = Tower.find(params[:id])
    end
end
