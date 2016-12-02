class TopicsController < ApplicationController
    def index
        @towers = Tower.all().order(id: :asc)
        @topics = Topic.all().order(id: :asc)
    end

    def new
        @tower = Tower.find(params[:tower_id])
    end

    def create
        @topic = Topic.new(topic_params)
        @topic.name = topic_params['name'].strip.downcase
        @topic.towers_id = topic_params['towers_id']

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
        @tower = Tower.find(@topic.towers_id)
        @zones = Zone.where(topics_id: @topic.id).order(difficulty: :asc)
        @zone = Zone.new
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])

        if @topic.update_attributes(topic_params)
            flash[:success] = "Edited Topic!"
            redirect_to topics_path
        else
            flash[:error] = "Error!"
            render 'edit'
        end
    end

    def destroy
        Topic.find(params[:id]).destroy
        flash[:success] = "Topic deleted"
        redirect_to topics_path
    end

    private
    def topic_params
        params.require(:topic).permit(:name, :towers_id)
    end
end
