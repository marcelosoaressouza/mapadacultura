# encoding: utf-8

class EntidadeEquipamentoAtividade < ActiveRecord::Base
  attr_accessible :ordem, :entidade_equipamento_id, :atividade_id

  belongs_to :entidade_equipamento
  belongs_to :atividade
end
