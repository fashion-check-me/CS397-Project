class RemoveSecondaryColorFromTags < ActiveRecord::Migration
  def change
    rename_column :tags, :primary_color, :color
    remove_column :tags, :secondary_color
  end
end
