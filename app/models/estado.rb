# encoding: utf-8

class Estado < ActiveRecord::Base
  attr_accessible :codigo_ibge, :nome, :sigla

  has_many :cidades
end
