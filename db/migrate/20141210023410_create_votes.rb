class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :yes
      t.integer :userid
      t.integer :outfitid

      t.timestamps
    end
  end
end
