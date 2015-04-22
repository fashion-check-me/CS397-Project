class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :userid
      t.integer :outfitid
      t.text :content

      t.timestamps null: false
    end

    add_foreign_key :comments, :outfits, column: :outfitid, on_delete: :cascade
    add_foreign_key :comments, :users, column: :userid, on_delete: :cascade
  end
end
