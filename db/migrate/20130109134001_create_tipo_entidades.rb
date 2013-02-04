class CreateTipoEntidades < ActiveRecord::Migration
  def change
    create_table :tipo_entidades do |t|
      t.string :nome
      t.string :slug
      t.text   :descricao

      t.timestamps
    end
  end
end
