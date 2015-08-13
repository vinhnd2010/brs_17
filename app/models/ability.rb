class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :create, Request
    else
      can [:create, :update], Request
      can [:create, :update, :destroy], Review, user_id: user.id
      can [:create, :update, :destroy], Comment, user_id: user.id
      can [:create, :destroy], Relationship, follower_id: user.id
      can [:create, :destroy], Like, user_id: user.id
      can [:create, :update, :destroy], BookUser , user_id: user.id
    end
  end
end
