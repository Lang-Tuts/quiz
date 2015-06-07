class AttendExamsController < ApplicationController
 
  def attendexam
      @exam_questions = Question.all.limit(10)
  end

  def completeexam
  end
  def submission
    @attend = Attendexam.new
    @attend.user_id = current_user.id
    @attend.exam_id = 1
    @ans = Answer.find(params[:id])
    @attend.question_id = @ans.question_id
    @attend.answer_id = params[:id]
    if @ans.actual_answer == 1
    @attend.mark = 1
    else
    @attend.mark = 0
    end
    @attend.save
  end
  def onlineusers
  end
end
