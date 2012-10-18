class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :contest_id
      t.integer :designer_id
      t.integer :image_id
      t.text :description
      
      t.timestamps
    end
  end
end
