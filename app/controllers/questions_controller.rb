class QuestionsController < ApplicationController
  def index
      @question = Question.all
  end
  def show
      @question = Question.find(params[:id])
      @answers = @question.answers
  end
  def create_question
      @question = Question.new
      @question.description = params[:questions][:description]
@question.save
      (1..4).each do |t|
        @ans = @question.answers.new
        if t == 1
            @ans.actual_answer = 1
        else
            @ans.actual_answer = 0
        end

        @ans.content = params[:answers][:"#{t}"]
        @ans.save
      end
      redirect_to :back
  end
  def allocate_to_exam
  end

  def new
  end
end
