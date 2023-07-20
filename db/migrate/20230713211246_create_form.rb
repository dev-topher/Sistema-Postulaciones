class CreateForm < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.references :question, foreign_key: true
      t.references :program, foreign_key: true
    end
  end
end
