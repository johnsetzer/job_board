class JobResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_post

  validates :response, :presence => true
  validates :resume, :presence => true
end