class AddAttachmentImagemToEntidadeEquipamentos < ActiveRecord::Migration
  def self.up
    change_table :entidade_equipamentos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :entidade_equipamentos, :imagem
  end
end
