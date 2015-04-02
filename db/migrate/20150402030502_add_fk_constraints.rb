class AddFkConstraints < ActiveRecord::Migration
  def change
    add_foreign_key :tags, :outfits, on_delete: :cascade, column: :outfitid
  end
end
