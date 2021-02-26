class ChangeCreatorIndexForGroups < ActiveRecord::Migration[6.1]
  def change
    remove_index :groups, :creator_id
    add_index :groups, :creator_id
  end
end
