class JobPost < ActiveRecord::Base
  belongs_to :user
  has_many :job_responses, :dependent => :destroy

  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :company, :presence => true, :length => { :maximum => 50 }
  validates :description, :presence => true

  def my_first_response(user_id)
    job_responses.where(:user_id => user_id).order("created_at").first
  end
end