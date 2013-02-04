class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :nome
      t.string :slug
      t.string :descricao
      t.boolean :publicar, :null => false, :default => true
      t.references :user
      t.references :entidade_equipamento

      t.timestamps
    end
    add_index :fotos, :user_id
    add_index :fotos, :entidade_equipamento_id
  end
end
