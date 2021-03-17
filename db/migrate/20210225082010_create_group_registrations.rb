class CreateGroupRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :group_registrations do |t|
      t.integer :group_id, null: false
      t.integer :member_id, null: false

      t.timestamps null: false
    end
    add_index :group_registrations, :group_id
    add_index :group_registrations, :member_id
    add_index :group_registrations, %i[member_id group_id]
  end
end
