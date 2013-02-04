class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome
      t.string :sigla
      t.string :codigo_ibge

      t.timestamps
    end
  end
end
