class CreateTipoEquipamentos < ActiveRecord::Migration
  def change
    create_table :tipo_equipamentos do |t|
      t.string :nome
      t.string :slug
      t.string :descricao

      t.timestamps
    end
  end
end
