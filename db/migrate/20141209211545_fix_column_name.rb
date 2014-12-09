class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :outfits, :title, :name
  end
end
