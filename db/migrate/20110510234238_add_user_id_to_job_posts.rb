class AddUserIdToJobPosts < ActiveRecord::Migration
  def self.up
    add_column :job_posts, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :job_posts, :user_id
  end
end