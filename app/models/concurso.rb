class Concurso < ActiveRecord::Base
  attr_accessible :contratante_id, :fim, :ganhador_id, :inicio, :nome, :premio
  
  class FimConcursoValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'deve ser maior que o inicio do concurso' unless value > record.inicio
    end
  end
  
  validates :nome,           :presence => true, :uniqueness => true 
  validates :contratante_id, :presence => true 
  validates :inicio,         :presence => true 
  validates :fim,            :presence => true, :fim_concurso => true
end
