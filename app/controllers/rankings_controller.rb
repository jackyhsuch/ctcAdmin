class RankingsController < ApplicationController
    def index
        @towers = Tower.all().order(id: :asc)
    end

    def show
        @tower = Tower.find(params[:id])
        @topics = Topic.where(towers_id: @tower.id)
    end
end
