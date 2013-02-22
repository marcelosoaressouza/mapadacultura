class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :nome
      t.string :slug
      t.string :descricao
      t.boolean :publicar
      t.references :user
      t.references :entidade_equipamento

      t.timestamps
    end
    add_index :videos, :user_id
    add_index :videos, :entidade_equipamento_id
  end
end
