class CreateJobResponses < ActiveRecord::Migration
  def self.up
    create_table :job_responses do |t|
      t.integer :user_id, :null => false
      t.integer :job_post_id, :null => false
      t.string :email, :limit => 100, :null => false
      t.text :response
      t.text :resume

      t.timestamps
    end
  end

  def self.down
    drop_table :job_responses
  end
end
