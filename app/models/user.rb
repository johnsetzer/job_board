class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :job_posts, :dependent => :destroy
  has_many :job_responses, :dependent => :destroy
  
  validates :name, :presence => true, :length => { :maximum => 50 }
end
