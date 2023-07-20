class CreateQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :question_type, null: false
      t.string :title, null: false
      t.integer :input_type, null: false
    end
  end
end
