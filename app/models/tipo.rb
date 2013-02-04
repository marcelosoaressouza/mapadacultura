# encoding: utf-8

class Tipo < ActiveRecord::Base
  attr_accessible :descricao, :nome, :slug

  has_many :entidade_equipamentos

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
