class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.date :hire_date
      t.dept :depts

      t.timestamps
    end
  end
end
