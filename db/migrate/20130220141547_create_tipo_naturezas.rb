class CreateTipoNaturezas < ActiveRecord::Migration
  def change
    create_table :tipo_naturezas do |t|
      t.string :nome
      t.string :slug

      t.timestamps
    end
  end
end
