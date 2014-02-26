class EntidadeEquipamentoNotificacao < ActionMailer::Base
  default from: "contato@mapadacultura.org"

  def adicionado(entidade_equipamento)
    @entidade_equipamento = entidade_equipamento

    mail to: "contato@mapadacultura.org", subject: "[Mapa da Cultura] Adicionado: #{@entidade_equipamento.nome}"
  end

  def publicado(entidade_equipamento)
    @entidade_equipamento = entidade_equipamento

    mail to: @entidade_equipamento.email, subject: "[Mapa da Cultura] Publicado: #{@entidade_equipamento.nome}"
  end
end
