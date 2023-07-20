class CreateDetailProgram < ActiveRecord::Migration[7.0]
  def change
    create_table :detail_programs do |t|
      t.references :program, foreign_key: true
      t.references :college, foreign_key: true

    end
  end
end
