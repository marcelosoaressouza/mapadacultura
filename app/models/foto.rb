# encoding: utf-8

class Foto < ActiveRecord::Base
  attr_accessible :descricao, :nome, :publicar, :slug, :foto, :entidade_equipamento_id, :user_id

  belongs_to :user
  belongs_to :entidade_equipamento

  has_attached_file :foto,
                    :url  => "/system/entidade_equipamentos/fotos/:id/:basename_:style.:extension",
                    :path => ":rails_root/public/system/entidade_equipamentos/fotos/:id/:basename_:style.:extension",
                    :styles => { :medium => "300x300>", :thumb => "150x150>" }

  extend FriendlyId
  friendly_id :nome, use: :slugged
end
