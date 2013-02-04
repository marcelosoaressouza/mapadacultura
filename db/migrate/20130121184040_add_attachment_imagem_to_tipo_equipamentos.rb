class AddAttachmentImagemToTipoEquipamentos < ActiveRecord::Migration
  def self.up
    change_table :tipo_equipamentos do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :tipo_equipamentos, :imagem
  end
end
