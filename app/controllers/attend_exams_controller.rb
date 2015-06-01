class AttendExamsController < ApplicationController
 
  def attendexam
      @exam_questions = Question.all.limit(2).reverse
  end

  def completeexam
  end

  def onlineusers
  end
end
