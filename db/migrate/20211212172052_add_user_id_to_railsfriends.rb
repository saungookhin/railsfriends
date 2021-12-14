class AddUserIdToRailsfriends < ActiveRecord::Migration[6.1]
  def change
    add_column :railsfriends, :user_id, :integer
    add_index :railsfriends, :user_id
  end
end
