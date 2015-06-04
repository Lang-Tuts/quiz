class AddQuestionToExams < ActiveRecord::Migration
  def change
    add_column :exams, :questionset, :text
  end
end
