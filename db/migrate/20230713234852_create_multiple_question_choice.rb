class CreateMultipleQuestionChoice < ActiveRecord::Migration[7.0]
  def change
    create_table :multiple_question_choices do |t|
      t.integer :option_pm, null: false
      t.references :question, foreign_key: true
    end
  end
end
