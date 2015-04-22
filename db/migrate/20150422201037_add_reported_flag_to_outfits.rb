class AddReportedFlagToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :reported, :boolean, :default => false
  end
end
