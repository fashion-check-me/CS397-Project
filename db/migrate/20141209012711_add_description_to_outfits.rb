class AddDescriptionToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :description, :text
  end
end
