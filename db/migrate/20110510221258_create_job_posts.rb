class CreateJobPosts < ActiveRecord::Migration
  def self.up
    create_table :job_posts do |t|
      t.string :title, :limit => 50, :null => false
      t.string :company, :limit => 50, :null => false
      t.text :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :job_posts
  end
end
