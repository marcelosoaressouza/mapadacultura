class CreateEntidadeEquipamentos < ActiveRecord::Migration
  def change
    create_table :entidade_equipamentos do |t|
      t.string  :nome
      t.string  :slug
      t.text    :descricao
      t.string  :apresenta
      t.string  :email
      t.string  :contato
      t.string  :site
      t.string  :logradouro
      t.string  :complemento
      t.string  :cidade
      t.string  :estado
      t.string  :cep
      t.float   :latitude
      t.float   :longitude
      t.boolean :gmaps,    :null => false, :default => false
      t.boolean :publicar, :null => false, :default => false
      t.string  :horario
      t.string  :personalidade
      t.references :tipo
      t.references :tipo_entidade
      t.references :tipo_equipamento
      t.references :atividade
      t.references :user
      t.references :tipo_finalidade

      t.timestamps
    end
    add_index :entidade_equipamentos, :tipo_id
    add_index :entidade_equipamentos, :tipo_entidade_id
    add_index :entidade_equipamentos, :tipo_equipamento_id
    add_index :entidade_equipamentos, :tipo_finalidade_id
    add_index :entidade_equipamentos, :atividade_id
    add_index :entidade_equipamentos, :user_id
  end
end
