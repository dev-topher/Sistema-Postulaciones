class CreateCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name, limit: 100
    end
  end
end
