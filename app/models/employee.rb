class Employee < ActiveRecord::Base
  attr_accessible :hire_date, :name

  validates :name, :presence => true           # Nome é obrigatório
  validates :name, :length => { :in => 3..60 } # Nome deve ter entre 3 e 60 caractéres (Não, nomes com 2 letras não existem [Só se forem chineses, mas chineses não são aceitos no sistema])
  validates :hire_date, :presence => true      # Data de contratação é obrigatória
  #Commit test
end
