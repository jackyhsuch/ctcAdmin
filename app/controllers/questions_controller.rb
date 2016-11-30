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
        @question.choice_A = question_params['choice_A']
        @question.choice_B = question_params['choice_B']
        @question.choice_C = question_params['choice_C']
        @question.choice_D = question_params['choice_D']
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
            redirect_to zone_path(@question.zone_id)
        else
            flash[:error] = "Error!"
            render 'edit'
        end
    end

    private
    def question_params
        params.require(:question).permit(:question, :choice_A, :choice_B, :choice_C, :choice_D, :answer, :zone_id)
    end
end
