class AddColumnsToExams < ActiveRecord::Migration
  def change
    add_column :exams, :user_id, :integer
    add_column :exams, :questions_count, :integer
  end
end
