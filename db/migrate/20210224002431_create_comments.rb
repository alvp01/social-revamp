class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :AuthorId
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
    add_index :comments, :AuthorId
  end
end
