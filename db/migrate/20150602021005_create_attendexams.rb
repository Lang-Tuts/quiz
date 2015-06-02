class CreateAttendexams < ActiveRecord::Migration
  def change
    create_table :attendexams do |t|
      t.integer :user_id
      t.integer :exam_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :mark

      t.timestamps null: false
    end
  end
end
