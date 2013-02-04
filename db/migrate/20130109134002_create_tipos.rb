class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nome
      t.string :slug
      t.text   :descricao

      t.timestamps
    end
  end
end
