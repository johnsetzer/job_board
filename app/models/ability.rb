class Ability
  include CanCan::Ability

  def initialize(user)
    #user ||= User.new # guest user (not logged in)

    # Default aliaises
    # alias_action :index, :show, :to => :read
    # alias_action :new, :to => :create
    # alias_action :edit, :to => :update
    alias_action :update, :destroy, :to => :modify


    # Anyone can view job posts
    can [:read], JobPost

    if !user.nil?
      # Any user can add job posts
      can [:create], JobPost

      # Any user can add job respones
      can [:create], JobResponse
      
      # Only post owners can edit their posts
      can [:modify], JobPost, :user_id => user.id

      # Only post owners can see their job responses
      can [:read], JobResponse, :user_id => user.id
    end
  end
end
