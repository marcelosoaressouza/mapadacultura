# encoding: utf-8

class TipoEntidade < ActiveRecord::Base
  attr_accessible :descricao, :nome, :slug, :imagem

  has_many :entidade_equipamentos

  has_attached_file :imagem,
                    :url => "/system/tipo_entidades/images/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/system/tipo_entidades/images/:id/:basename_:style.:extension",
                    :styles => { :medium => "64x64>", :thumb => "24x24>" }

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
