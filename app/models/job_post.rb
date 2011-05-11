class JobPost < ActiveRecord::Base
  belongs_to :user
  has_many :job_responses

  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :company, :presence => true, :length => { :maximum => 50 }
  validates :description, :presence => true
end
