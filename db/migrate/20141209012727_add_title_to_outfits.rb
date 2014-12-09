class AddTitleToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :title, :text
  end
end
