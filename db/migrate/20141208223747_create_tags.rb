class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|

      t.timestamps
    end
    
    execute "ALTER TABLE Tags ADD outfitID INTEGER NOT NULL REFERENCES Outfits(id) ON DELETE CASCADE"
    execute "ALTER TABLE Tags ADD pattern TEXT NOT NULL"
    execute "ALTER TABLE Tags ADD category TEXT NOT NULL"
    execute "ALTER TABLE Tags ADD brand TEXT NOT NULL"
    execute "ALTER TABLE Tags ADD primary_color TEXT NOT NULL"
    execute "ALTER TABLE Tags ADD secondary_color TEXT NOT NULL"
  end
end
