class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.date :dob
      t.string :mobile
      t.string :designation
      t.integer :salary
  
      t.timestamps
    end
  end
end
