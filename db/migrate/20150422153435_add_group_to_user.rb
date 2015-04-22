class AddGroupToUser < ActiveRecord::Migration
  def change
    add_column :users, :group, :string, :default => "regular", :null => false
  end
end
