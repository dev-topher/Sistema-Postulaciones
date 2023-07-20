class AddAdditionalFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rut, :string, null: false
    add_column :users, :name, :string, null: false
    add_column :users, :enrollment, :integer, null: false
    add_column :users, :d_born, :date, null: false
    add_column :users, :regular_student, :boolean, null: false
    add_column :users, :credits_approved, :integer, null: false
    add_column :users, :failed_subjects, :integer, null: false
    add_column :users, :has_debts, :boolean, null: false
    add_column :users, :has_intern_debts, :boolean, null: false
    add_reference :users, :career, foreign_key: true
  end
end