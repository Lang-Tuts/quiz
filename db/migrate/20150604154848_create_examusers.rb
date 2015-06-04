class CreateExamusers < ActiveRecord::Migration
  def change
    create_table :examusers do |t|
      t.integer :exam_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
