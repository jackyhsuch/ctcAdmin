class ZonesController < ApplicationController
    def show
        @zone = Zone.find(params['id'])
        @topic = Topic.find(@zone.topic_id)
        @tower = Tower.find(@topic.tower_id)

        @questions = Question.where(zone_id: params['id'])
        @count = 1
    end

    def new
    end

    def create
        @topic = Topic.find(zone_params['topic_id'])
        @tower = Tower.find(@topic.tower_id)

        @zone = Zone.new
        @zone.name = zone_params['name'].strip
        @zone.topic_id = zone_params['topic_id']
        @zone.difficulty = zone_params['difficulty']




        if @zone.save!
            flash[:success] = "New tower added successfully!"
            redirect_to topics_show_path(:topic_id => @topic.id)
        else
            flash[:error] = "Error!"
            redirect_to topics_show_path(:topic_id => @topic.id)
        end
    end

    private
    def zone_params
        params.require(:zone).permit(:name, :difficulty, :topic_id)
    end
end
