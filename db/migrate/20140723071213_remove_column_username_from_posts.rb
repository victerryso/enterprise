class RemoveColumnUsernameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :username, :string
  end
end
