class AddAttachmentImageToRegions < ActiveRecord::Migration[5.0]
 def up
    add_attachment :regions, :image
  end

  def down
    remove_attachment :regions, :image
  end
end
