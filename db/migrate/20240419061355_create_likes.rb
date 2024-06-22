class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :like_by_id
      t.string :likeable_type
      t.integer :likeable_id

      t.timestamps
    end
  end
end
 

 # add_index :likes, [:user_id, :post_id], unique: true
 