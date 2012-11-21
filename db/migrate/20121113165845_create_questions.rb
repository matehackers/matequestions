class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :inquiry
      t.string :answer
      t.integer :answer_type

      t.timestamps
    end
  end
end
