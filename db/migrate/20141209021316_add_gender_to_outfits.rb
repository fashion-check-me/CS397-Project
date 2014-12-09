class AddGenderToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :gender, :text
  end
end
