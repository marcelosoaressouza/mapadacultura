class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome
      t.string :codigo_ibge
      t.references :estado

      t.timestamps
    end
    add_index :cidades, :estado_id
  end
end
