class Teste < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :michelao
      t.string :hue
      t.timestamps
    end
  end
end
