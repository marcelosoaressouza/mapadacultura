class AddAttachmentImagemToTipoEntidades < ActiveRecord::Migration
  def self.up
    change_table :tipo_entidades do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :tipo_entidades, :imagem
  end
end
