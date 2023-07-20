class CreateCollege < ActiveRecord::Migration[7.0]
  def change
    create_table :colleges do |t|
      t.string :name, null: false

      t.references :country, foreign_key: true
    end
  end
end
