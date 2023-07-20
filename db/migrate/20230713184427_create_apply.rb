class CreateApply < ActiveRecord::Migration[7.0]
  def change
    create_table :applies do |t|
      t.string  :citizenship
      t.integer :mobile
      t.string :second_email

      t.integer :second_language, null: false
      t.integer :third_language, null: false
      t.integer :first_college, null: false
      t.integer :second_college, null: false
      t.integer :third_college, null: false
      t.integer :seelected, null: false, default: 0
      
      t.integer :status, default: 1

      t.references :announcement, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

  end
end