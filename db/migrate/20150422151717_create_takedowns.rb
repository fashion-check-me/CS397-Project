class CreateTakedowns < ActiveRecord::Migration
  def change
    create_table :takedowns do |t|
      t.string :url
      t.string :description
      t.string :claimant

      t.timestamps null: false
    end
  end
end
