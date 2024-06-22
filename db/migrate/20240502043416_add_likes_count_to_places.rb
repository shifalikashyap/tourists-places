class AddLikesCountToPlaces < ActiveRecord::Migration[7.0]
  def change
    add_column :places, :likes_count, :integer
  end
end
