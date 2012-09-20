#!/bin/env ruby
# encoding: utf-8
class Concurso < ActiveRecord::Base
  attr_accessible :contratante_id, :fim, :ganhador_id, :inicio, :nome, :premio
  
  belongs_to :contratante, :class_name => "Usuario"
  belongs_to :ganhador, :class_name => "Usuario"
  
  class FimConcursoValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add attribute, 'deve ser maior que o início do concurso' unless value > record.inicio
    end
  end
  
  validates :nome,        :presence => true, :uniqueness => true 
  validates :contratante, :presence => true 
  validates :inicio,      :presence => true 
  validates :fim,         :presence => true, :fim_concurso => true
end
