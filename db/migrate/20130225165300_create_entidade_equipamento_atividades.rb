class CreateEntidadeEquipamentoAtividades < ActiveRecord::Migration
  def change
    create_table :entidade_equipamento_atividades do |t|
      t.integer :ordem
      t.references :entidade_equipamento
      t.references :atividade

      t.timestamps
    end
    add_index :entidade_equipamento_atividades, :entidade_equipamento_id, :name => 'entidade'
    add_index :entidade_equipamento_atividades, :atividade_id, :name => 'atividade'
  end
end
