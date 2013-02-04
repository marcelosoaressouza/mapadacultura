class AddAttachmentImagemToAtividades < ActiveRecord::Migration
  def self.up
    change_table :atividades do |t|
      t.attachment :imagem
    end
  end

  def self.down
    drop_attached_file :atividades, :imagem
  end
end
