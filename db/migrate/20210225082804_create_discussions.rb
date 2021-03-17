class CreateDiscussions < ActiveRecord::Migration[6.1]
  def change
    create_table :discussions do |t|
      t.string :text
      t.integer :AuthorId
      t.integer :group_id
      t.timestamps
    end
    add_index :discussions, :AuthorId
    add_index :discussions, :group_id
    add_index :discussions, %i[AuthorId group_id]
  end
end
