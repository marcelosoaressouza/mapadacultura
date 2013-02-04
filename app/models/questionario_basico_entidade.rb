# encoding: utf-8

class QuestionarioBasicoEntidade < ActiveRecord::Base
  attr_accessible :acoes_desenvolvidas, :frequencia_acoes, :frequencia_participacao_eventos, :frequencia_producao_eventos, :participa_eventos, :principais_atividades, :produz_eventos, :inicio_atividades, :user_id, :entidade_equipamento_id

  belongs_to :entidade_equipamento
  belongs_to :user

  serialize :acoes_desenvolvidas, Hash
  serialize :frequencia_acoes, Hash
  serialize :frequencia_participacao_eventos, Hash
  serialize :frequencia_producao_eventos, Hash
end
