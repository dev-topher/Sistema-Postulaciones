class CreateCareer < ActiveRecord::Migration[7.0]
  def change
    create_table :careers do |t|
      t.string :name, null: false
      t.integer :credits, null: false

      t.references :college, foreign_key: true
    end
  end
end
