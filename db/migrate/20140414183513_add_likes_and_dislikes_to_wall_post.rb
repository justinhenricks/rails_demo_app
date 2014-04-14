class AddLikesAndDislikesToWallPost < ActiveRecord::Migration
  def change
    add_column :wallposts, :likes, :integer
    add_column :wallposts, :dislikes, :integer
  end
end
