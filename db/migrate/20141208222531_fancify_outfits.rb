class FancifyOutfits < ActiveRecord::Migration
  def change
    execute "ALTER TABLE Outfits ADD userID INTEGER NOT NULL REFERENCES Users(id) ON DELETE CASCADE"
  end
end
