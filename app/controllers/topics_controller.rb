class TopicsController < ApplicationController
    def index
        @towers = Tower.all()
        @topics = Topics.all()
    end
end
