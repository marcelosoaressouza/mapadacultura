# encoding: utf-8

class TipoNatureza < ActiveRecord::Base
  attr_accessible :nome, :slug

  has_many :entidade_equipamentos

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
