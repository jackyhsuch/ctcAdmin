class ZonesController < ApplicationController
    def show
        @zone = Zone.find(params['id'])
        @topic = Topic.find(@zone.topic_id)
        @tower = Tower.find(@topic.tower_id)

        @questions = Question.where(zone_id: params['id']).order(id: :asc)
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
            redirect_to topic_path(@topic.id)
        else
            flash[:error] = "Error!"
            redirect_to topic_path(@topic.id)
        end
    end

    def edit
        @zone = Zone.find(params[:id])
        @topic = Topic.find(params[:topic_id])
    end

    def update
         @zone = Zone.find(params[:id])

        if @zone.update_attributes(zone_params)
            flash[:success] = "Edited Zone!"
            redirect_to topic_path(zone_params[:topic_id])
        else
            flash[:error] = "Error!"
            render 'edit'
        end
    end

    def destroy
        topic_id = Zone.find(params[:id]).topic_id
        Zone.find(params[:id]).destroy
        flash[:success] = "Zone deleted"
        redirect_to topic_path(topic_id)
    end

    private
    def zone_params
        params.require(:zone).permit(:name, :difficulty, :topic_id)
    end
end
