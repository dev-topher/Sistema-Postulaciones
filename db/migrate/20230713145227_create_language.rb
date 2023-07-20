class CreateLanguage < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :language, null: false
      t.integer :status, null: false, default: 1

    end
  end
end
