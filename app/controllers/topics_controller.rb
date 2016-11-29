class TopicsController < ApplicationController
    def index
        @towers = Tower.all()
        @topics = Topic.all()
    end

    def new
        @tower = Tower.find(params[:tower_id])
    end

    def create
        @topic = Topic.new(topic_params)
        @topic.name = topic_params['name'].strip.downcase
        @topic.tower_id = topic_params['tower_id']

        if @topic.save!
            flash[:success] = "New tower added successfully!"
            redirect_to topics_path
        else
            flash[:error] = "Error!"
            @tower = Tower.find(params[:tower_id])
            render 'new'
        end
    end

    def show
        @topic = Topic.find(params[:id])
        @tower = Tower.find(@topic.tower_id)
        @zones = Zone.where(topic_id: @topic.id)
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])

        if @topic.update_attributes(topic_params)
            flash[:success] = "Edited!"
            redirect_to topics_path
        else
            flash[:error] = "Error!"
            render 'edit'
        end
    end

    private
    def topic_params
        params.require(:topic).permit(:name, :tower_id)
    end
end
