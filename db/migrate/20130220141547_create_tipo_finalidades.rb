class CreateTipoFinalidades < ActiveRecord::Migration
  def change
    create_table :tipo_finalidades do |t|
      t.string :nome
      t.string :slug

      t.timestamps
    end
  end
end
