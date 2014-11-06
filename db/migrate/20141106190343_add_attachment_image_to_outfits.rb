class AddAttachmentImageToOutfits < ActiveRecord::Migration
  def self.up
    change_table :outfits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :outfits, :image
  end
end
