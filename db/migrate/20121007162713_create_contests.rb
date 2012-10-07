class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.integer :winner_id
      t.integer :contractor_id
      t.float :prize

      t.timestamps
    end
  end
end
