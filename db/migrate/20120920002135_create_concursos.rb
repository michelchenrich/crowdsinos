class CreateConcursos < ActiveRecord::Migration
  def change
    create_table :concursos do |t|
      t.string :nome
      t.datetime :inicio
      t.datetime :fim
      t.integer :ganhador_id
      t.integer :contratante_id
      t.float :premio

      t.timestamps
    end
  end
end
