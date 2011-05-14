class DropEmailFromJobResponses < ActiveRecord::Migration
  def self.up
    remove_column :job_responses, :email
  end

  def self.down
    add_column :job_responses, :email, :string, :limit => 100, :null => false
  end
end
