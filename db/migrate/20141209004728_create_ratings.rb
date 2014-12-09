class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|

      t.timestamps
    end

    execute "ALTER TABLE Ratings ADD userID INTEGER NOT NULL REFERENCES Users(id) ON DELETE CASCADE"
    execute "ALTER TABLE Ratings ADD outfitID INTEGER NOT NULL REFERENCES Outfits(id) ON DELETE CASCADE"
    execute "ALTER TABLE Ratings ADD value INTEGER NOT NULL"
  end
end
