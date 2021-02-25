class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :group_name, null: false
      t.string :group_description
      t.integer :creator_id, null: false
      t.string :cover_image, default: ''
      t.timestamps
    end
    add_index :groups, :creator_id, unique: true
    add_index :groups, :group_name, unique: true
  end
end
