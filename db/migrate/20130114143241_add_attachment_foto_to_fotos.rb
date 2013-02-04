class AddAttachmentFotoToFotos < ActiveRecord::Migration
  def self.up
    change_table :fotos do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :fotos, :foto
  end
end
