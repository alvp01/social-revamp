class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string  :text
      t.integer :AuthorId

      t.timestamps
    end
    add_index :posts, :AuthorId
  end
end
