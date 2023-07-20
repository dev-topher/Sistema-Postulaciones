class CreateProgram < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 1

    end

  end
end
