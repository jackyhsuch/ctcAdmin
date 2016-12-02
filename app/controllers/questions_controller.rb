class QuestionsController < ApplicationController
    def new
        @zone = Zone.find(params[:zone_id])
        @topic = Topic.find(@zone.topic_id)
        @tower = Tower.find(@topic.tower_id)
    end

    def create
        @zone = Zone.find(question_params['zone_id'])
        # @topic = Topic.find(@zone.topic_id)
        # @tower = Tower.find(@topic.tower_id)


        @question = Question.new(question_params)
        @question.question = question_params['question']
        @question.a = question_params['a']
        @question.b = question_params['b']
        @question.c = question_params['c']
        @question.d = question_params['d']
        @question.answer = question_params['answer'].downcase
        @question.zone_id = question_params['zone_id']

        if @question.save!
            flash[:success] = "New question added successfully!"
            redirect_to zone_path(@zone.id)
        else
            flash[:error] = "Error!"
            @zone = Zone.find(params[:zone_id])
            render 'new'
        end
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        @question = Question.find(params[:id])

        if @question.update_attributes(question_params)
            flash[:success] = "Edited Question!"
            redirect_to zone_path(@question.zones_id)
        else
            flash[:error] = "Error!"
            render 'edit'
        end
    end

    def destroy
        zone_id = Question.find(params[:id]).zone_id
        Question.find(params[:id]).destroy
        flash[:success] = "Question deleted"
        redirect_to zone_path(zone_id)
    end

    private
    def question_params
        params.require(:question).permit(:question, :a, :b, :c, :d, :answer, :zone_id)
    end
end
