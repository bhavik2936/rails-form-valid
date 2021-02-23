class AddManagerRefToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :manager, null: false, foreign_key: true
  end
end
