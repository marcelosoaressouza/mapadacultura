# encoding: utf-8

class Cidade < ActiveRecord::Base
  attr_accessible :codigo_ibge, :nome, :estado_id

  belongs_to :estado
end
