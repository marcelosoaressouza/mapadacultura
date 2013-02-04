class CreateQuestionarioBasicoEntidades < ActiveRecord::Migration
  def change
    create_table :questionario_basico_entidades do |t|
      t.string  :inicio_atividades
      t.text    :principais_atividades
      t.string  :acoes_desenvolvidas
      t.string  :frequencia_acoes
      t.boolean :produz_eventos,             :null => false, :default => false
      t.string  :frequencia_producao_eventos
      t.boolean :participa_eventos,          :null => false, :default => false
      t.string  :frequencia_participacao_eventos
      t.references :entidade_equipamento
      t.references :user

      t.timestamps
    end
    add_index :questionario_basico_entidades, :entidade_equipamento_id
    add_index :questionario_basico_entidades, :user_id
  end
end
